import 'package:flutter_starter/features/photo/domain/photo.dart';

abstract class PhotoDataSource {
  Future<List<Photo>> fetchPhotos(int page, int pageSize);
}
