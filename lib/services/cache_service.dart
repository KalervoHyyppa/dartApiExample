import 'dart:async';

import 'package:dartApiExample/models/cache_model.dart';
import 'package:dartApiExample/models/response_model.dart';

/**
 * Cache Service for keeping cached values of previous requests
 * 
 * When the class is initialized, it will run [_init], which trims cached values based on dates
 * 
 * The reason of trimming results every hour is:
 * News updates frequently, so caching results for an hour for requests should
 * limit unnecessary API calls while allowing to get updated results if news changes
 */
class CacheService {
  static const defaultDuration = Duration(hours: 1);
  CacheService() : super() {
    _init();
  }
  Map<String, CacheModel> _cache = {};

  /// Inits a periodic function that executes [_trimCache]
  _init() {
    Timer.periodic(
      defaultDuration,
      (Timer t) {
        print(this._cache);
        _trimCache();
      },
    );
  }

  /// Trims cache that is older then the [defaultDuration]
  _trimCache() {
    final trimmedCache = {...this._cache};
    final anHourAgo = DateTime.now().subtract(defaultDuration);

    trimmedCache.removeWhere((key, value) {
      return anHourAgo.compareTo(value.requestTime) > 0;
    });

    this._cache = trimmedCache;
  }

  /// Check Cache for supplied [requestHash]
  ///
  /// It will check the cache to see if it contains the [requestHash]
  ///
  /// If it does contain the request hash it will return a list of cached [ResponseModel].
  /// This responses were previously made and have not yet expired (been trimmed by [_init])
  ///
  /// If it does not contain the request hash, it will return [null]
  List<ResponseModel>? checkCache({required String requestHash}) {
    return _cache[requestHash]?.responses;
  }

  /// Adds responses to cache with a time stamp
  ///
  /// [requestHash] is the hash of the request made
  ///
  /// [responses] are all the returned responses from the news apis
  addToCache({
    required String requestHash,
    required List<ResponseModel> responses,
  }) {
    final updatedCache = {..._cache};
    updatedCache[requestHash] = CacheModel(
      requestTime: DateTime.now(),
      responses: responses,
    );
    this._cache = updatedCache;
  }
}
