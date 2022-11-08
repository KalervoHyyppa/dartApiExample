import 'dart:convert';

import 'package:dartApiExample/constants/gnews_constants.dart';
import 'package:dartApiExample/models/response_model.dart';
import 'package:dartApiExample/utils/gnews_utils.dart';
import 'package:http/http.dart' as http;

class GNewsApi {
  static const String apiKey = '73b4dc49ed5eca363737431a2359e532';

  /// Gets articles from the GnewsAPI
  ///
  /// [keyWords] are a list of words the article should be related to
  ///
  /// [maxArticles] is the maximum number of articles to get
  Future<List<ResponseModel>> getGnewsArticles({
    required List<String> keyWords,
    required int maxArticles,
    required String author,
  }) async {
    final Map<String, String> queryParams = {
      'q': parseKeyWords(keyWords),
      'max': maxArticles.toString(),
      'token': apiKey,
    };
    Uri uri = Uri.https(
      gNewsBaseUrl,
      gNewsUnencodedPath,
      queryParams,
    );
    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final List<dynamic> articlesJson = json["articles"];
    final List<ResponseModel> responses = [];
    articlesJson.forEach((article) {
      responses.add(convertGnewsJsonToResponseModal(article));
    });

    return responses;
  }
}
