import 'package:dartApiExample/utils/hash_utils.dart';
import 'package:http/http.dart' as http;

import 'package:dartApiExample/models/parameter_model.dart';
import 'package:dartApiExample/models/response_model.dart';
import 'package:dartApiExample/services/cache_service.dart';
import 'package:dartApiExample/api/gnews_api.dart';
import 'package:dartApiExample/utils/response_utils.dart';

/**
 * Fetches Articles
 * 
 * This will first see if the request hash is in cache
 * If so, return those values to save API reads
 * 
 * Else, 
 * request articles from APIs
 * Add meta data
 * Add to cache
 */
Future<List<ResponseModel>> fetchArticles({
  required CacheService cacheService,
  required ParameterModel parameters,
  required http.Client httpClient,
}) async {
  final requestHash = hashQuery(parameters);
  final cachedResponses = cacheService.checkCache(
    requestHash: requestHash,
  );

  if (cachedResponses != null) {
    return cachedResponses;
  } else {
    try {
      List<ResponseModel> allResponses = [];

      // If you wanted to add any other API's, you would add them here
      final gnewsArticles = await GNewsApi().getGnewsArticles(
        keyWords: parameters.keyWords,
        maxArticles: parameters.maxArticles,
        author: parameters.author,
        httpClient: httpClient,
      );

      allResponses.addAll(gnewsArticles);

      allResponses = saturateMetadata(allResponses);

      cacheService.addToCache(
        requestHash: requestHash,
        responses: allResponses,
      );
      return allResponses;
    } catch (e) {
      throw (e);
    }
  }
}
