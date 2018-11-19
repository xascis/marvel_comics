import 'package:json_annotation/json_annotation.dart';

part 'comic_summary.g.dart';

@JsonSerializable()
class ComicSummary {
  final String resourceURI;
  final String name;

  ComicSummary(this.resourceURI, this.name);

  factory ComicSummary.fromJson(Map<String, dynamic> json) => _$ComicSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ComicSummaryToJson(this);

}