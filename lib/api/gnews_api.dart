import 'dart:convert';

import 'package:dartApiExample/constants/gnews_constants.dart';
import 'package:dartApiExample/models/response_model.dart';
import 'package:dartApiExample/utils/gnews_utils.dart';
import 'package:http/http.dart';

class GNewsApi {
  static const String apiKey = '73b4dc49ed5eca363737431a2359e532';

  /// Gets articles from the GnewsAPI
  ///
  /// [keyWords] are a list of words the article should be related to
  ///
  /// [maxArticles] is the maximum number of articles to get
  ///
  /// [author] is the author of an article, gNews does not natively support author as a search param, so adding to keyWords
  Future<List<ResponseModel>> getGnewsArticles({
    required List<String> keyWords,
    required int maxArticles,
    required String? author,
    required Client httpClient,
  }) async {
    final searchKeyWords = author != null ? [...keyWords, author] : keyWords;

    final Map<String, String> queryParams = {
      'q': parseKeyWords(searchKeyWords),
      'max': maxArticles.toString(),
      'token': apiKey,
      'lang': 'en',
    };

    Uri uri = Uri.https(gNewsBaseUrl, gNewsUnencodedPath, queryParams);

    final response = await httpClient.get(uri);
    final json = jsonDecode(response.body);

    final List<dynamic> articlesJson = json["articles"];

    final List<ResponseModel> responses = [];

    articlesJson.forEach((article) {
      responses.add(convertGnewsJsonToResponseModel(article));
    });

    return responses;
  }
}
