import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_comics/domain/models/thumbnail.dart';
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
  final Thumbnail thumbnail;

  Character(this.id, this.name, this.description, this.modified, this.resourceURI, this.urls, this.thumbnail);
}