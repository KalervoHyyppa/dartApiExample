import 'package:dartApiExample/services/cache_service.dart';
import 'package:test/test.dart';

import 'constants/response_constants.dart';

void main() {
  group('Cache Service Tests', () {
    test('Test Reading Cache for existing value', () {
      final CacheService cacheService = CacheService();

      cacheService.addToCache(requestHash: 'test', responses: [fakeResponseModel]);

      final modelsInCache = cacheService.checkCache(requestHash: 'test');

      expect(modelsInCache?.contains(fakeResponseModel), isTrue);
    });

    test('Test Reading Cache for hash value not present', () {
      final CacheService cacheService = CacheService();

      cacheService.addToCache(requestHash: 'testOther', responses: [fakeResponseModel]);

      final modelsInCache = cacheService.checkCache(requestHash: 'test');

      expect(modelsInCache, isNull);
    });

    test('Test trimming aged cache', () async {
      final CacheService cacheService = CacheService(Duration(seconds: 1));

      cacheService.addToCache(requestHash: 'test', responses: [fakeResponseModel]);
      final modelsInCacheBeforeTrim = cacheService.checkCache(requestHash: 'test');
      expect(modelsInCacheBeforeTrim?.contains(fakeResponseModel), isTrue);

      // Wait for the default duration plus a little more time to ensure file is trimmed
      // await Future.delayed(CacheService.defaultDuration);
      await Future.delayed(Duration(seconds: 2));

      final modelsInCacheAfterTrim = cacheService.checkCache(requestHash: 'test');
      expect(modelsInCacheAfterTrim, isNull);
    });
  });
}
