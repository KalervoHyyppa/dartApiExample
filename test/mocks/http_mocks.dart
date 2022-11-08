import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../constants/http_constants.dart';
import '../constants/response_constants.dart';
import 'http_mocks.mocks.dart';

@GenerateMocks([
  http.Client,
])
MockClient getBasicHttpMocks() {
  MockClient mockClient = MockClient();

  when(mockClient.get(Uri.parse(gnewsUriPath))).thenAnswer((realInvocation) async {
    return Response(jsonEncode(gNewsResponseJson), 200);
  });

  return mockClient;
}
