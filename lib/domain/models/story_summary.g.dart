// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorySummary _$StorySummaryFromJson(Map<String, dynamic> json) {
  return StorySummary(json['resourceURI'] as String, json['name'] as String,
      json['type'] as String);
}

Map<String, dynamic> _$StorySummaryToJson(StorySummary instance) =>
    <String, dynamic>{
      'resourceURI': instance.resourceURI,
      'name': instance.name,
      'type': instance.type
    };
