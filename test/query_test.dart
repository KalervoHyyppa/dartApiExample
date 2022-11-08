import 'package:dartApiExample/constants/error_codes.dart';
import 'package:dartApiExample/models/parameter_model.dart';
import 'package:dartApiExample/utils/query_utils.dart';
import 'package:test/test.dart';

void main() {
  group('Query Parameters Tests', () {
    test('Test successful query parameter check', () {
      final result = checkQueryParameters({
        'keyWords': ['test1'],
        'author': ['Fake Author'],
        'maxArticles': ['10'],
      });

      expect(
          result ==
              ParameterModel(
                keyWords: ['test1'],
                author: 'Fake Author',
                maxArticles: 10,
              ),
          isTrue);
    });

    test('Test missing keywords', () {
      try {
        checkQueryParameters({
          'author': ['Fake Author'],
          'maxArticles': ['10'],
        });
      } catch (e) {
        expect(e == missingQueryParameters, isTrue);
      }
    });
  });

  group('Query Method Tests', () {
    test('Test successful query method check', () {
      expect(checkQueryMethod(method: 'GET'), isNull);
    });

    test('Test failed query method check', () {
      try {
        checkQueryMethod(method: 'PUT');
      } catch (e) {
        expect(e == unsupportedApiRequest, isTrue);
      }
    });
  });
}
