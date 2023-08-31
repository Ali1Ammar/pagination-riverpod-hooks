// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse<T> _$PaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationResponse<T>(
      meta: MetaData.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
    );

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      page: json['page'] as int,
      perPage: json['perPage'] as int,
      totalPage: json['totalPage'] as int,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'totalPage': instance.totalPage,
    };
