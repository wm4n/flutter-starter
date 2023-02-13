import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/features/photo/domain/photo.dart';
import 'package:flutter_starter/features/photo/viewmodel/photo_list_view_model.dart';
import 'package:flutter_starter/features/photo/screen/photo_detail_screen.dart';
import 'package:flutter_starter/generated/l10n.dart';
import 'package:flutter_starter/shared/text_theme.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:timeago/timeago.dart' as timeago;

class PhotoListScreen extends StatelessWidget {
  final PagingController<int, Photo> _pagingController =
      PagingController(firstPageKey: 1);
  final PhotoListViewModel _photoViewModel = Get.put(PhotoListViewModel());

  PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).appTitle)),
        body: GetBuilder<PhotoListViewModel>(
            initState: (state) {
              _pagingController.addPageRequestListener(
                  (_) => _photoViewModel.loadMorePhoto());
              _photoViewModel.loadPhotoList();
            },
            dispose: (state) => _pagingController.dispose(),
            builder: (viewModel) {
              return Container(
                  color: const Color(0xFFF9F9F9),
                  child: PagedListView<int, Photo>(
                    pagingController: _pagingController
                      ..value = PagingState(
                          nextPageKey: viewModel.page.value,
                          itemList: viewModel.photoList),
                    builderDelegate: PagedChildBuilderDelegate<Photo>(
                      itemBuilder: (context, item, index) =>
                          renderListItem(context, viewModel.photoList[index]),
                      noItemsFoundIndicatorBuilder: (_) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ));
            }));
  }

  Widget renderListItem(BuildContext context, Photo photo) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 2,
        child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 96,
            ),
            child: Center(
                child: ListTile(
                    onTap: () =>
                        {Get.to(() => PhotoDetailScreen(), arguments: photo)},
                    leading: CachedNetworkImage(
                        width: 80,
                        height: 80,
                        imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        imageUrl: photo.url,
                        placeholder: (context, url) =>
                            Image.asset('assets/images/img_placeholder.png'),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error)),
                    title: Text(photo.id, style: MyTextTheme.primaryText),
                    subtitle: Text(
                      S.of(context).createdAtTimeByWho(
                          timeago.format(DateTime.parse(photo.createdAt),
                              locale:
                                  Localizations.localeOf(context).toString()),
                          photo.username),
                      style: MyTextTheme.secondaryText,
                    ),
                    trailing: SizedBox(
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.thumb_up,
                              color: Color(0xFFFF7800),
                              size: 24.0,
                              semanticLabel: 'Like Count',
                            ),
                            Text('${photo.likeCount}',
                                textAlign: TextAlign.left,
                                style: MyTextTheme.hintText)
                          ],
                        ))))));
  }
}
