// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesList _$SeriesListFromJson(Map<String, dynamic> json) {
  return SeriesList(
      json['available'] as int,
      json['returned'] as int,
      json['collectionURI'] as String,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : SeriesSummary.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SeriesListToJson(SeriesList instance) =>
    <String, dynamic>{
      'available': instance.available,
      'returned': instance.returned,
      'collectionURI': instance.collectionURI,
      'items': instance.items
    };
