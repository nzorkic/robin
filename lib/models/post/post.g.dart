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
    currentHabitat: _$enumDecode(_$HabitatEnumMap, json['currentHabitat']),
    condition: _$enumDecode(_$ConditionEnumMap, json['condition']),
    gender:
        _$enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.unknown,
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
      'currentHabitat': _$HabitatEnumMap[instance.currentHabitat],
      'condition': _$ConditionEnumMap[instance.condition],
      'gender': _$GenderEnumMap[instance.gender],
      'description': instance.description,
      'location': instance.location,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$HabitatEnumMap = {
  Habitat.street: 'street',
  Habitat.foster: 'foster',
};

const _$ConditionEnumMap = {
  Condition.well: 'well',
  Condition.injured: 'injured',
  Condition.badlyInjured: 'badlyInjured',
  Condition.dead: 'dead',
};

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
};
