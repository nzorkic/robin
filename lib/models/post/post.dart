// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../geo/geo.dart';
import '../user/user.dart';

part 'post.g.dart';
part 'post.freezed.dart';

enum Habitat { street, foster }

enum Condition { well, sick, injured, dead }

enum Gender { male, female, unknown }

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required User author,
    required DateTime date,
    required Habitat currentHabitat,
    required Condition condition,
    @Default(Gender.unknown) Gender gender,
    @Default('') String description,
    Geo? location,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
