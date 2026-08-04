import 'package:eze/core/components/app_cached_network_image.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class ProfileGalleryGrid extends StatelessWidget {
  final Widget? start;

  const ProfileGalleryGrid({super.key, this.start});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 6 + (start == null ? 0 : 1),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: UISizes.sp4,
        crossAxisSpacing: UISizes.sp4,
      ),
      itemBuilder: (context, i) {
        if (start != null && i == 0) return start;
        return const AppCachedNetworkImage(
          "https://images.pexels.com/photos/7275385/pexels-photo-7275385.jpeg?cs=srgb&dl=pexels-dziana-hasanbekava-7275385.jpg&fm=jpg",
        );
      },
    );
  }
}
