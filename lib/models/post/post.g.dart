// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    id: json['id'] as int,
    author: User.fromJson(json['author'] as Map<String, dynamic>),
    date: DateTime.parse(json['date'] as String),
    media:
        (json['media'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    description: json['description'] as String? ?? '',
    location: json['location'] == null
        ? null
        : Geo.fromJson(json['location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'date': instance.date.toIso8601String(),
      'media': instance.media,
      'description': instance.description,
      'location': instance.location,
    };
