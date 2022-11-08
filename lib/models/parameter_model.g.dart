// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ParameterModel _$$_ParameterModelFromJson(Map<String, dynamic> json) =>
    _$_ParameterModel(
      keyWords:
          (json['keyWords'] as List<dynamic>).map((e) => e as String).toList(),
      maxArticles: json['maxArticles'] as int? ?? 10,
      author: json['author'] as String?,
    );

Map<String, dynamic> _$$_ParameterModelToJson(_$_ParameterModel instance) =>
    <String, dynamic>{
      'keyWords': instance.keyWords,
      'maxArticles': instance.maxArticles,
      'author': instance.author,
    };
