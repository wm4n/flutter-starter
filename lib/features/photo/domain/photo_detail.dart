// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class PhotoDetail {
  final String id;
  final String createdAt;
  final int downloads;
  final int likeCount;
  final String description;
  final List<String> tags;
  final int width;
  final int height;
  PhotoDetail({
    required this.id,
    required this.createdAt,
    required this.downloads,
    required this.likeCount,
    required this.description,
    required this.tags,
    required this.width,
    required this.height,
  });

  PhotoDetail copyWith({
    String? id,
    String? createdAt,
    int? downloads,
    int? likeCount,
    String? description,
    List<String>? tags,
    int? width,
    int? height,
  }) {
    return PhotoDetail(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      downloads: downloads ?? this.downloads,
      likeCount: likeCount ?? this.likeCount,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'downloads': downloads,
      'likeCount': likeCount,
      'description': description,
      'tags': tags,
      'width': width,
      'height': height,
    };
  }

  factory PhotoDetail.fromMap(Map<String, dynamic> map) {
    final list = List<String>.from(
        (map['tags'] as List).map((e) => e['title']).toList());
    final o = PhotoDetail(
        id: map['id'] as String,
        createdAt: map['created_at'] as String,
        downloads: map['downloads'] as int,
        likeCount: map['likes'] as int,
        width: map['width'] as int,
        height: map['height'] as int,
        description:
            map['description'] != null ? map['description'] as String : '',
        tags: list);
    return o;
  }

  String toJson() => json.encode(toMap());

  factory PhotoDetail.fromJson(String source) =>
      PhotoDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhotoDetail(id: $id, createdAt: $createdAt, downloads: $downloads, likeCount: $likeCount, description: $description, tags: $tags, width: $width, height: $height)';
  }

  @override
  bool operator ==(covariant PhotoDetail other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.downloads == downloads &&
        other.likeCount == likeCount &&
        other.description == description &&
        listEquals(other.tags, tags) &&
        other.width == width &&
        other.height == height;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        downloads.hashCode ^
        likeCount.hashCode ^
        description.hashCode ^
        tags.hashCode ^
        width.hashCode ^
        height.hashCode;
  }
}
