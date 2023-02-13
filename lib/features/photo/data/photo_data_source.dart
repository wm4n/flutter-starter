import 'package:flutter_starter/features/photo/domain/photo.dart';
import 'package:flutter_starter/features/photo/domain/photo_detail.dart';

abstract class PhotoDataSource {
  Future<List<Photo>> fetchPhotos(int page, int pageSize);
  Future<PhotoDetail?> fetchPhotoDetail(String id);
}
