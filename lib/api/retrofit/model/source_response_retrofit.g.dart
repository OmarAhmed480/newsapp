// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_response_retrofit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceResponseRetrofit _$SourceResponseRetrofitFromJson(
  Map<String, dynamic> json,
) => SourceResponseRetrofit(
  status: json['status'] as String?,
  sources: (json['sources'] as List<dynamic>?)
      ?.map((e) => SourceRetrofit.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
  code: json['code'] as String?,
);

Map<String, dynamic> _$SourceResponseRetrofitToJson(
  SourceResponseRetrofit instance,
) => <String, dynamic>{
  'status': instance.status,
  'code': instance.code,
  'message': instance.message,
  'sources': instance.sources,
};
