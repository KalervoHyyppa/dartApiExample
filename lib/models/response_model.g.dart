// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseModel _$$_ResponseModelFromJson(Map<String, dynamic> json) =>
    _$_ResponseModel(
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      url: json['url'] as String,
      image: json['image'] as String,
      publishedAt: json['publishedAt'] as String,
      sourceName: json['sourceName'] as String,
      wordFrequencyMap:
          (json['wordFrequencyMap'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as int),
              ) ??
              const {},
    );

Map<String, dynamic> _$$_ResponseModelToJson(_$_ResponseModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'url': instance.url,
      'image': instance.image,
      'publishedAt': instance.publishedAt,
      'sourceName': instance.sourceName,
      'wordFrequencyMap': instance.wordFrequencyMap,
    };
