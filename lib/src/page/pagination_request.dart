import 'package:json_annotation/json_annotation.dart';
part "pagination_request.g.dart";

@JsonSerializable()
class PaginationRequest {
  final int page;
  final int perPage;

  PaginationRequest({
    required this.page,
    required this.perPage,
  });

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);
}
