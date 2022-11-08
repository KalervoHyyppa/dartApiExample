import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameter_model.freezed.dart';
part 'parameter_model.g.dart';

@freezed
class ParameterModel with _$ParameterModel {
  const factory ParameterModel({
    @Default(10) int maxArticles,
    String? author,
  }) = _ParameterModel;

  factory ParameterModel.fromJson(Map<String, dynamic> json) => _$ParameterModelFromJson(json);
}
