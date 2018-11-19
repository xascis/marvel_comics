// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventList _$EventListFromJson(Map<String, dynamic> json) {
  return EventList(
      json['available'] as int,
      json['returned'] as int,
      json['collectionURI'] as String,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : EventSummary.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EventListToJson(EventList instance) => <String, dynamic>{
      'available': instance.available,
      'returned': instance.returned,
      'collectionURI': instance.collectionURI,
      'items': instance.items
    };
