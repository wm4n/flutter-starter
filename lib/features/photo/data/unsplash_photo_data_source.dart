import 'dart:convert';

import 'package:flutter_starter/features/photo/domain/photo_detail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_starter/features/photo/data/photo_data_source.dart';
import 'package:flutter_starter/features/photo/domain/photo.dart';

class UnsplashPhotoDataSource extends PhotoDataSource {
  final accessKey = '<access key here>';

  @override
  Future<List<Photo>> fetchPhotos(int page, int pageSize) async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?client_id=$accessKey&per_page=30&page=$page&order_by=popular'));

    return Photo.fromJsonList(jsonDecode(response.body));
  }

  @override
  Future<PhotoDetail?> fetchPhotoDetail(String id) async {
    final response = await http.get(
        Uri.parse('https://api.unsplash.com/photos/$id?client_id=$accessKey'));
    return PhotoDetail.fromJson(response.body);
  }
}
