// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryList _$StoryListFromJson(Map<String, dynamic> json) {
  return StoryList(
      json['available'] as int,
      json['returned'] as int,
      json['collectionURI'] as String,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : StorySummary.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$StoryListToJson(StoryList instance) => <String, dynamic>{
      'available': instance.available,
      'returned': instance.returned,
      'collectionURI': instance.collectionURI,
      'items': instance.items
    };
