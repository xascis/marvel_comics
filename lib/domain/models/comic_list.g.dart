// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicList _$ComicListFromJson(Map<String, dynamic> json) {
  return ComicList(
      json['available'] as int,
      json['returned'] as int,
      json['collectionURI'] as String,
      (json['items'] as List)
          ?.map((e) => e == null
              ? null
              : ComicSummary.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ComicListToJson(ComicList instance) => <String, dynamic>{
      'available': instance.available,
      'returned': instance.returned,
      'collectionURI': instance.collectionURI,
      'items': instance.items
    };
