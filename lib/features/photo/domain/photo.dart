// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Photo {
  final String id;
  final String url;
  final String createdAt;
  final String description;
  final String username;
  final int likeCount;

  Photo(
      {required this.id,
      required this.url,
      required this.createdAt,
      required this.description,
      required this.username,
      required this.likeCount});

  static List<Photo> fromJsonList(Iterable jsonList) {
    return jsonList
        .map((e) => Photo(
            id: e['id'],
            url: e['urls']['small'],
            createdAt: e['created_at'],
            description: e['description'] ?? '',
            username: e['user']['username'],
            likeCount: e['likes']))
        .toList();
  }

  Photo copyWith({
    String? id,
    String? url,
    String? createdAt,
    String? description,
    String? username,
    int? likeCount,
  }) {
    return Photo(
      id: id ?? this.id,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      username: username ?? this.username,
      likeCount: likeCount ?? this.likeCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'createdAt': createdAt,
      'description': description,
      'username': username,
      'likeCount': likeCount,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id'] as String,
      url: map['url'] as String,
      createdAt: map['createdAt'] as String,
      description: map['description'] as String,
      username: map['username'] as String,
      likeCount: map['likeCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Photo(id: $id, url: $url, createdAt: $createdAt, description: $description, username: $username, likeCount: $likeCount)';
  }

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.url == url &&
        other.createdAt == createdAt &&
        other.description == description &&
        other.username == username &&
        other.likeCount == likeCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        url.hashCode ^
        createdAt.hashCode ^
        description.hashCode ^
        username.hashCode ^
        likeCount.hashCode;
  }
}
