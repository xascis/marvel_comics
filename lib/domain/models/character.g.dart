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
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      (json['comics'] as List)
          ?.map((e) =>
              e == null ? null : ComicList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['stories'] as List)
          ?.map((e) =>
              e == null ? null : StoryList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['events'] as List)
          ?.map((e) =>
              e == null ? null : EventList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['series'] as List)
          ?.map((e) =>
              e == null ? null : SeriesList.fromJson(e as Map<String, dynamic>))
          ?.toList());
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
