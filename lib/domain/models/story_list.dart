import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_comics/domain/models/story_summary.dart';

part 'story_list.g.dart';

@JsonSerializable()
class StoryList {
  final int available;
  final int returned;
  final String collectionURI;
  final List<StorySummary> items;

  StoryList(this.available, this.returned, this.collectionURI, this.items);

  factory StoryList.fromJson(Map<String, dynamic> json) => _$StoryListFromJson(json);

  Map<String, dynamic> toJson() => _$StoryListToJson(this);
}