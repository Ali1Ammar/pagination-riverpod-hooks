import 'package:json_annotation/json_annotation.dart';

part "pagination_response.g.dart";

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class PaginationResponse<T> {
  final List<T> data;

  bool get isCompleted =>
      data.isEmpty; // if we get empty data that mean we completed

  PaginationResponse({required this.data});

  factory PaginationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) dataFromJson) =>
      _$PaginationResponseFromJson(json, dataFromJson);
}
