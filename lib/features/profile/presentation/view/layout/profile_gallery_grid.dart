import 'package:eze/core/components/app_cached_network_image.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/shared/data/models/typed_media_model.dart';
import 'package:flutter/material.dart';

class ProfileGalleryGrid extends StatelessWidget {
  final Widget? start;
  final List<TypedMediaModel> gallery;

  const ProfileGalleryGrid({super.key, required this.gallery, this.start});

  @override
  Widget build(BuildContext context) {
    final hasStart = start != null;
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: gallery.length + (hasStart ? 1 : 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: UISizes.sp4,
        crossAxisSpacing: UISizes.sp4,
      ),
      itemBuilder: (context, index) {
        if (hasStart && index == 0) return start!;
        final offset = hasStart ? 1 : 0;
        return AppCachedNetworkImage(gallery[index - offset].media);
      },
    );
  }
}
