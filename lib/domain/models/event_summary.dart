import 'package:json_annotation/json_annotation.dart';

part 'event_summary.g.dart';

@JsonSerializable()
class EventSummary {
  final String resourceURI;
  final String name;

  EventSummary(this.resourceURI, this.name);

  factory EventSummary.fromJson(Map<String, dynamic> json) => _$EventSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$EventSummaryToJson(this);
}