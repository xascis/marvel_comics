import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_comics/domain/models/comic_summary.dart';

part 'comic_list.g.dart';

@JsonSerializable()
class ComicList {
  final int available;
  final int returned;
  final String collectionURI;
  final List<ComicSummary> items;

  ComicList(this.available, this.returned, this.collectionURI, this.items);

  factory ComicList.fromJson(Map<String, dynamic> json) => _$ComicListFromJson(json);

  Map<String, dynamic> toJson() => _$ComicListToJson(this);
}