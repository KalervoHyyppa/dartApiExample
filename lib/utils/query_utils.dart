import 'dart:io';

import 'package:dartApiExample/constants/error_codes.dart';
import 'package:dartApiExample/models/parameter_model.dart';

ParameterModel checkQueryParameters(Map<String, List<String>> queryParameters) {
  if (!queryParameters.containsKey('keyWords')) {
    throw (missingQueryParameters);
  }

  final String? author = queryParameters['author']?[0];
  final String? maxArticlesString = queryParameters['maxArticles']?[0];
  final List<String> keyWords = queryParameters['keyWords']!;

  final parameters = ParameterModel(
    author: author,
    maxArticles: maxArticlesString != null ? int.parse(maxArticlesString) : 10,
    keyWords: keyWords,
  );

  return parameters;
}

checkQueryMethod({
  required String method,
  required HttpResponse response,
}) {
  switch (method) {
    case 'GET':
      break;
    default:
      throw (unsupportedApiRequest);
  }
}
