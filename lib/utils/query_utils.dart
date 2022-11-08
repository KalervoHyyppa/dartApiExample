import 'dart:io';

import 'package:dartApiExample/models/parameter_model.dart';

ParameterModel checkQueryParameters(Map<String, String> queryParameters) {
  final parameters = ParameterModel(
    author: queryParameters['author'],
    maxArticles: queryParameters['maxArticles'],
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
      response.statusCode = HttpStatus.forbidden;
      response.write('Get requests only allowed for this API');
  }
}
