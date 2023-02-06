import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:flutter_starter/features/photo/domain/photo.dart';
import 'package:flutter_starter/features/photo/presentation/photo_list_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  final PagingController<int, Photo> _pagingController =
      PagingController(firstPageKey: 1);
  final PhotoListViewModel _viewModel = PhotoListViewModel();

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _viewModel.loadMorePhoto();
    });
    _viewModel.loadPhotoList();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PhotoListViewModel>(
              create: (context) => _viewModel)
        ],
        builder: (context, child) => MaterialApp(
            title: 'Photo List',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
                appBar: AppBar(title: const Text('Photo List')),
                body: Consumer<PhotoListViewModel>(
                    builder: (_, viewModel, child) {
                  List<Photo> list = viewModel.getPhotoList;
                  return PagedListView<int, Photo>(
                    pagingController: _pagingController
                      ..value = PagingState(
                          nextPageKey: viewModel.getNextPageNo,
                          itemList: viewModel.getPhotoList),
                    builderDelegate: PagedChildBuilderDelegate<Photo>(
                      itemBuilder: (context, item, index) =>
                          itemView(list[index]),
                    ),
                  );
                }))));
  }

  Widget itemView(Photo photo) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(10),
                child: CachedNetworkImage(
                    width: 80,
                    height: 80,
                    imageUrl: photo.url,
                    placeholder: (context, url) =>
                        Image.asset('assets/images/img_placeholder.png'),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error))),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('By ${photo.username}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Roboto',
                                color: Color(0xFF292929),
                                fontWeight: FontWeight.w800,
                              )),
                          Text(
                              'Created ${timeago.format(DateTime.parse(photo.createdAt))}',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Roboto',
                                color: Color(0xFF7E7E7E),
                                fontWeight: FontWeight.w600,
                              )),
                          Row(
                            children: [
                              const Icon(
                                Icons.thumb_up,
                                color: Color(0xFFFF7800),
                                size: 24.0,
                                semanticLabel: 'Like Count',
                              ),
                              Text(' ${photo.likeCount}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF7E7E7E),
                                    fontWeight: FontWeight.w600,
                                  ))
                            ],
                          )
                        ])))
          ],
        ),
      ),
    );
  }
}
