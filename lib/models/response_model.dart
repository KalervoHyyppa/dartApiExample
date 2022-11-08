import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required String title,
    required String description,
    required String content,
    required String url,
    required String image,
    required String publishedAt,
    required String sourceName,
    @Default({}) Map<String, int> wordFrequencyMap,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);
}
