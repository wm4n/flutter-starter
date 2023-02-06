import 'package:flutter/material.dart';
import 'package:flutter_starter/features/photo/data/photo_repository.dart';
import 'package:flutter_starter/features/photo/domain/photo.dart';

class PhotoListViewModel with ChangeNotifier {
  PhotoListViewModel();

  static const defaultPageSize = 30;

  PhotoRepository repository = PhotoRepository();

  late List<Photo> photoList = List.empty();
  late int page = 1;

  get getPhotoList => photoList;

  get getNextPageNo => page;

  Future<void> loadPhotoList() async {
    photoList = List.empty();
    page++;
    photoList = await repository.fetchPhotos(page, defaultPageSize);
    print('photo list load first ${photoList.length}');
    notifyListeners();
  }

  Future<void> loadMorePhoto() async {
    page++;
    photoList = [
      ...photoList,
      ...(await repository.fetchPhotos(page, defaultPageSize))
    ];
    print('photo list load more ${photoList.length}');
    notifyListeners();
  }
}
