import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/features/photo/viewmodel/photo_detail_view_model.dart';
import 'package:flutter_starter/features/photo/domain/photo.dart';
import 'package:flutter_starter/features/photo/domain/photo_detail.dart';
import 'package:flutter_starter/generated/l10n.dart';
import 'package:flutter_starter/shared/text_theme.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class PhotoDetailScreen extends StatelessWidget {
  PhotoDetailScreen({super.key});

  final PhotoDetailViewModel _photoViewModel = Get.put(PhotoDetailViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Text(S.of(context).authorPhotoTitle(Get.arguments.username))),
        body: renderDetailScreen(context, Get.arguments));
  }

  Widget renderDetailScreen(BuildContext context, Photo photo) {
    return Obx(() {
      if (_photoViewModel.photoDetail.value != null) {
        return SingleChildScrollView(
            child: Container(
                color: const Color(0xFFF9F9F9),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    renderPhoto(photo.url),
                    const SizedBox(height: 16),
                    renderDetail(context, _photoViewModel.photoDetail.value!)
                  ],
                )));
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

  Widget renderPhoto(String url) {
    return CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        imageUrl: url,
        placeholder: (context, url) =>
            Image.asset('assets/images/img_placeholder.png'),
        errorWidget: (context, url, error) => const Icon(Icons.error));
  }

  Widget renderDetail(BuildContext context, PhotoDetail detail) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Expanded(
            flex: 1,
            child: widgetWrapper(const Icon(Icons.aspect_ratio),
                alignment: Alignment.centerRight)),
        Expanded(
            flex: 4,
            child: widgetWrapper(
                Text(
                  '${detail.width} x ${detail.height}',
                  style: MyTextTheme.secondaryText,
                ),
                alignment: Alignment.centerLeft))
      ]),
      Row(children: [
        Expanded(
            flex: 1,
            child: widgetWrapper(const Icon(Icons.timelapse),
                alignment: Alignment.centerRight)),
        Expanded(
            flex: 4,
            child: widgetWrapper(
                Text(
                    S.of(context).createdAtTime(timeago.format(
                        DateTime.parse(detail.createdAt),
                        locale: Localizations.localeOf(context).toString())),
                    style: MyTextTheme.secondaryText),
                alignment: Alignment.centerLeft))
      ]),
      Row(children: [
        Expanded(
            flex: 1,
            child: widgetWrapper(const Icon(Icons.description),
                alignment: Alignment.centerRight)),
        Expanded(
            flex: 4,
            child: widgetWrapper(
                Text(
                    detail.description != ''
                        ? detail.description
                        : S.of(context).infoNotAvailable,
                    style: MyTextTheme.secondaryText),
                alignment: Alignment.centerLeft))
      ]),
      Row(children: [
        Expanded(
            flex: 1,
            child: widgetWrapper(const Icon(Icons.download),
                alignment: Alignment.centerRight)),
        Expanded(
            flex: 4,
            child: widgetWrapper(
                Text(detail.downloads.toString(),
                    style: MyTextTheme.secondaryText),
                alignment: Alignment.centerLeft))
      ]),
      Row(children: [
        Expanded(
            flex: 1,
            child: widgetWrapper(const Icon(Icons.tag),
                alignment: Alignment.topRight)),
        Expanded(
            flex: 4,
            child: widgetWrapper(
                Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: 2,
                    children: detail.tags
                        .map((e) =>
                            Chip(label: Text(e, style: MyTextTheme.hintText)))
                        .toList()),
                alignment: Alignment.centerLeft))
      ]),
    ]);
  }

  Widget widgetWrapper(Widget widget,
      {Alignment alignment = Alignment.center}) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        alignment: alignment,
        // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: widget);
  }

  Widget tagWrapper(BuildContext context, Widget widget) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Theme.of(context).primaryColor,
                child: widget)));
  }
}
