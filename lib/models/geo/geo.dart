// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo.g.dart';
part 'geo.freezed.dart';

@freezed
class Geo with _$Geo {
  const factory Geo({
    @Default(0.0) double lat,
    @Default(0.0) double lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}
