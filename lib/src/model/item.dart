import 'package:json_annotation/json_annotation.dart';

part "item.g.dart";

@JsonSerializable()
class Item {
  final String id;
  final String name;
  Item(this.id, this.name);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
