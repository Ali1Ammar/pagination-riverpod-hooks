import 'package:json_annotation/json_annotation.dart';
import 'package:pagination/src/page/pagination_request.dart';

part "pagination_response.g.dart";

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PaginationResponse<T> {
  final MetaData meta;
  final List<T> data;

  bool get isCompleted => meta.page >= meta.totalPage;
  PaginationRequest nextPage() =>
      PaginationRequest(perPage: meta.perPage, page: meta.page + 1);

  PaginationResponse({required this.meta, required this.data});

  factory PaginationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) dataFromJson) =>
      _$PaginationResponseFromJson(json, dataFromJson);
}

@JsonSerializable()
class MetaData {
  final int page;
  final int perPage;
  final int totalPage;

  MetaData(
      {required this.page, required this.perPage, required this.totalPage});

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
