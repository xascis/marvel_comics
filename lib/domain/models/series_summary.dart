import 'package:json_annotation/json_annotation.dart';

part 'series_summary.g.dart';

@JsonSerializable()
class SeriesSummary {
  final String resourceURI;
  final String name;

  SeriesSummary(this.resourceURI, this.name);

  factory SeriesSummary.fromJson(Map<String, dynamic> json) => _$SeriesSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesSummaryToJson(this);
}