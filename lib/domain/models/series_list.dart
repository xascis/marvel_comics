import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_comics/domain/models/series_summary.dart';

part 'series_list.g.dart';

@JsonSerializable()
class SeriesList {
  final int available;
  final int returned;
  final String collectionURI;
  final List<SeriesSummary> items;

  SeriesList(this.available, this.returned, this.collectionURI, this.items);

  factory SeriesList.fromJson(Map<String, dynamic> json) => _$SeriesListFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesListToJson(this);
}
