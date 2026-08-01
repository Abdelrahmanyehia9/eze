import 'package:eze/core/components/app_cached_network_image.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class UserCircleAvatar extends StatelessWidget {
  final double? size;
  final bool showName;
  const UserCircleAvatar._({this.size, this.showName = false});
  factory UserCircleAvatar({double? size}) =>
      UserCircleAvatar._(size: size);
  factory UserCircleAvatar.withName({double? size}) =>
      UserCircleAvatar._(size: size, showName: true);
  @override
  Widget build(BuildContext context) {
    final size = this.size ?? UISizes.sp72;
    return Column(
      spacing: UISizes.sp2,
      children: [
        ClipOval(
          child: AppCachedNetworkImage(
            width: size,
            height: size,
            "https://images.pexels.com/photos/7275385/pexels-photo-7275385.jpeg?cs=srgb&dl=pexels-dziana-hasanbekava-7275385.jpg&fm=jpg",
          ),
        ),
        if (showName)
          Expanded(
            child: SizedBox(
              width: size,
              child: AppText(
                "مريم الهوارى".split(" ").first,
                textAlign: TextAlign.center,
                height: 0,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelSmall,
              ),
            ),
          ),
      ],
    );
  }
}
