import 'dart:convert';

import 'package:crypto/crypto.dart';
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
 * request articles from API's
 * Add meta data
 * Add to cache
 */
Future<List<ResponseModel>> fetchArticles({
  required CacheService cacheService,
  required ParameterModel parameters,
}) async {
  // QQQQ maybe pretty up
  Map<String, dynamic> hashObject = {
    'maxArticles': parameters.maxArticles,
    'author': parameters.author,
    'keyWords': parameters.keyWords,
  };

  final bytes = utf8.encode(hashObject.toString());
  int requestHash = sha1.convert(bytes).hashCode;

  final cachedResponses = cacheService.checkCache(
    requestHash: requestHash.toString(),
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
      );

      allResponses.addAll(gnewsArticles);

      allResponses = saturateMetadata(allResponses);

      cacheService.addToCache(
        requestHash: requestHash.toString(),
        responses: allResponses,
      );
      return allResponses;
    } catch (e) {
      throw (e);
    }
  }
}
