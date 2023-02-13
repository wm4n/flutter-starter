import 'package:flutter_starter/features/photo/data/photo_repository.dart';
import 'package:flutter_starter/features/photo/domain/photo_detail.dart';
import 'package:get/get.dart';

class PhotoDetailViewModel extends GetxController {
  PhotoDetailViewModel();

  PhotoRepository repository = PhotoRepository();

  final Rxn<PhotoDetail> photoDetail = Rxn<PhotoDetail>();

  @override
  void onReady() async {
    super.onReady();
    loadPhotoDetail(Get.arguments.id);
  }

  Future<void> loadPhotoDetail(String id) async {
    final detail = await repository.fetchDetail(id);
    photoDetail(detail);
    update();
  }
}
