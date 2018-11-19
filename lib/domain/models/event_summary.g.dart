// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventSummary _$EventSummaryFromJson(Map<String, dynamic> json) {
  return EventSummary(json['resourceURI'] as String, json['name'] as String);
}

Map<String, dynamic> _$EventSummaryToJson(EventSummary instance) =>
    <String, dynamic>{
      'resourceURI': instance.resourceURI,
      'name': instance.name
    };
