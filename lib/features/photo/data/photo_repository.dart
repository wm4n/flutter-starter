import 'package:flutter_starter/features/photo/data/photo_data_source.dart';
import 'package:flutter_starter/features/photo/data/unsplash_photo_data_source.dart';
import 'package:flutter_starter/features/photo/domain/photo.dart';

class PhotoRepository {
  final List<PhotoDataSource> dataSources = [UnsplashPhotoDataSource()];

  Future<List<Photo>> fetchPhotos(int page, int pageSize) async {
    List<Photo> photoList = [];
    PhotoDataSource source;
    for (source in dataSources) {
      photoList = await source.fetchPhotos(page, pageSize);
      if (photoList.isNotEmpty) {
        break;
      }
    }
    return photoList;
  }
}
