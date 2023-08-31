import 'package:json_annotation/json_annotation.dart';
part "pagination_request.g.dart";

@JsonSerializable()
class PaginationRequest {
  final String? cursor;

  PaginationRequest({
    this.cursor,
  });

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);
}