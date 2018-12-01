// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['modified'] == null
          ? null
          : DateTime.parse(json['modified'] as String),
      json['resourceURI'] as String,
      (json['urls'] as List)
          ?.map(
              (e) => e == null ? null : Url.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['thumbnail'] == null
          ? null
          : Image.fromJson(json['thumbnail'] as Map<String, dynamic>),
      json['comics'] == null
          ? null
          : ComicList.fromJson(json['comics'] as Map<String, dynamic>),
      json['stories'] == null
          ? null
          : StoryList.fromJson(json['stories'] as Map<String, dynamic>),
      json['events'] == null
          ? null
          : EventList.fromJson(json['events'] as Map<String, dynamic>),
      json['series'] == null
          ? null
          : SeriesList.fromJson(json['series'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'modified': instance.modified?.toIso8601String(),
      'resourceURI': instance.resourceURI,
      'urls': instance.urls,
      'thumbnail': instance.thumbnail,
      'comics': instance.comics,
      'stories': instance.stories,
      'events': instance.events,
      'series': instance.series
    };
