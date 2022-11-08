import 'package:dartApiExample/constants/error_codes.dart';
import 'package:dartApiExample/models/parameter_model.dart';

/// Checks the parameters in request
///
/// [keyWords] is required, if missing it will throw [missingQueryParameters]
///
/// If required parameters are present it will return a [ParameterModel]
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

/// Checks query method
///
/// Only allowed query method is ['GET']
///
/// Will throw [unsupportedApiRequest] if another method is used
checkQueryMethod({
  required String method,
}) {
  switch (method) {
    case 'GET':
      break;
    default:
      throw (unsupportedApiRequest);
  }
}
