import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_comics/domain/models/comic_list.dart';
import 'package:marvel_comics/domain/models/event_list.dart';
import 'package:marvel_comics/domain/models/series_list.dart';
import 'package:marvel_comics/domain/models/story_list.dart';
import 'package:marvel_comics/domain/models/image.dart';
import 'package:marvel_comics/domain/models/url.dart';

part 'character.g.dart';

@JsonSerializable()
class Character{
  final int id;
  final String name;
  final String description;
  final DateTime modified;
  final String resourceURI;
  final List<Url> urls;
  final Image thumbnail;
  final ComicList comics;
  final StoryList stories;
  final EventList events;
  final SeriesList series;

  Character(this.id, this.name, this.description, this.modified, this.resourceURI, this.urls, this.thumbnail, this.comics, this.stories, this.events, this.series);

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}