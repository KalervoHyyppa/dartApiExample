import 'package:dartApiExample/fetch_article.dart';
import 'package:dartApiExample/services/cache_service.dart';
import 'package:dartApiExample/utils/gnews_utils.dart';
import 'package:dartApiExample/utils/response_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'constants/http_constants.dart';
import 'constants/parameter_constants.dart';
import 'constants/response_constants.dart';
import 'mocks/http_mocks.dart';
import 'mocks/http_mocks.mocks.dart';

void main() {
  group('Article Fetch Tests', () {
    test('Test getting articles', () async {
      final CacheService cacheService = CacheService();
      final MockClient mockClient = getBasicHttpMocks();

      final results = await fetchArticles(
        cacheService: cacheService,
        parameters: fakeParameterModel,
        httpClient: mockClient,
      );

      verify(mockClient.get(Uri.parse(gnewsUriPath))).called(1);

      final List<Map<String, Object>> articles = gNewsResponseJson['articles'];

      var response = articles.map((article) => convertGnewsJsonToResponseModel(article)).toList();
      print('QQQQ results length ${results.length}');

      response = saturateMetadata(response);

      expect(response[0] == results[0], isTrue);
    });
  });
}
