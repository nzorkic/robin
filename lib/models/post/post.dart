// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:robin/models/geo/geo.dart';
import 'package:robin/models/user/user.dart';

part 'post.g.dart';
part 'post.freezed.dart';

// TODO: set default image

@freezed
class Post with _$Post {
  const factory Post({
    required int id,
    required User author,
    required DateTime date,
    @Default([]) List<String> media,
    @Default('') String description,
    Geo? location,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
