import 'package:flutter_starter/features/photo/data/photo_repository.dart';
import 'package:flutter_starter/features/photo/domain/photo.dart';
import 'package:get/state_manager.dart';

class PhotoListViewModel extends GetxController {
  PhotoListViewModel();

  static const defaultPageSize = 30;

  PhotoRepository repository = PhotoRepository();

  final photoList = <Photo>[].obs;
  final page = 1.obs;

  Future<void> loadPhotoList() async {
    photoList.clear();
    page(1);
    photoList.addAll(await repository.fetchPhotos(page.value, defaultPageSize));
    update();
  }

  Future<void> loadMorePhoto() async {
    page(page.value + 1);
    photoList.addAll(await repository.fetchPhotos(page.value, defaultPageSize));
    update();
  }
}
