import 'package:dartApiExample/models/response_model.dart';

class CacheModel {
  final DateTime requestTime;
  final List<ResponseModel> responses;

  CacheModel({
    required this.requestTime,
    required this.responses,
  });
}
