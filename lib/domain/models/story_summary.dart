import 'package:json_annotation/json_annotation.dart';

part 'story_summary.g.dart';

@JsonSerializable()
class StorySummary {
  final String resourceURI;
  final String name;
  final String type;

  StorySummary(this.resourceURI, this.name, this.type);

  factory StorySummary.fromJson(Map<String, dynamic> json) => _$StorySummaryFromJson(json);

  Map<String, dynamic> toJson() => _$StorySummaryToJson(this);
}