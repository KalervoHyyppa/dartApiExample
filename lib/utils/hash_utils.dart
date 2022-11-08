import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dartApiExample/models/parameter_model.dart';

/// Creates a hash based on the request parameters
String hashQuery(ParameterModel parameters) {
  Map<String, dynamic> hashObject = {
    'maxArticles': parameters.maxArticles,
    'author': parameters.author,
    'keyWords': parameters.keyWords,
  };

  final bytes = utf8.encode(hashObject.toString());
  int requestHash = sha1.convert(bytes).hashCode;

  return requestHash.toString();
}
