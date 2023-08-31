// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationRequest _$PaginationRequestFromJson(Map<String, dynamic> json) =>
    PaginationRequest(
      page: json['page'] as int,
      perPage: json['perPage'] as int,
    );

Map<String, dynamic> _$PaginationRequestToJson(PaginationRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
    };
