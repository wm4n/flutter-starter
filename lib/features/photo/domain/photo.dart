class Photo {
  final String id;
  final String url;
  final String createdAt;
  final String description;
  final String username;
  final int likeCount;

  const Photo(
      {required this.id,
      required this.url,
      required this.createdAt,
      required this.description,
      required this.username,
      required this.likeCount});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        id: json['id'],
        url: json['urls']['small'],
        createdAt: json['created_at'],
        description: json['description'],
        username: json['user']['username'],
        likeCount: json['likes']);
  }

  static List<Photo> fromJsonList(Iterable jsonList) {
    return jsonList
        .map((e) => Photo(
            id: e['id'],
            url: e['urls']['small'],
            createdAt: e['created_at'],
            description: e['description'] ?? 'N/A',
            username: e['user']['username'],
            likeCount: e['likes']))
        .toList();
  }
}
