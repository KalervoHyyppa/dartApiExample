import 'dart:convert';
import 'dart:io';

import 'package:dartApiExample/constants/error_codes.dart';
import 'package:dartApiExample/constants/url_constants.dart';
import 'package:dartApiExample/fetch_article.dart';
import 'package:dartApiExample/models/parameter_model.dart';
import 'package:dartApiExample/models/response_model.dart';
import 'package:dartApiExample/services/cache_service.dart';
import 'package:dartApiExample/utils/query_utils.dart';

/**
 * 
 */

void main() async {
  CacheService cacheService = CacheService();

  Stream<HttpRequest> server;

  try {
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  } catch (e) {
    print("Couldn't bind to port 8080: $e");
    exit(-1);
  }

  await for (HttpRequest req in server) {
    final String method = req.method;
    final HttpResponse response = req.response;
    final Uri uri = req.uri;

    try {
      checkQueryMethod(
        method: method,
        response: response,
      );

      final ParameterModel parameters = checkQueryParameters(uri.queryParametersAll);

      switch (uri.path) {
        case searchArticlesUrl:
          final List<ResponseModel> articles = await fetchArticles(
            cacheService: cacheService,
            parameters: parameters,
          );

          final List<Map<String, dynamic>> responses = articles.map((e) => e.toJson()).toList();

          response.statusCode = HttpStatus.ok;

          response.write(jsonEncode(responses));

          break;
        default:
          response.statusCode = HttpStatus.notFound;
          response.write('Url Not Found');
      }
    } catch (e) {
      switch (e) {
        case missingQueryParameters:
          response.statusCode = HttpStatus.badRequest;
          response.write(missingQueryParameters);
          break;
        case unsupportedApiRequest:
          response.statusCode = HttpStatus.methodNotAllowed;
          response.write(unsupportedApiRequest);
          break;
        default:
          response.statusCode = HttpStatus.internalServerError;
          response.write('Error requesting articles');
      }
      print('QQQQ main e $e');
      print('QQQQ main e runtime ${e.runtimeType}');
    }

    response.close();
  }
}
