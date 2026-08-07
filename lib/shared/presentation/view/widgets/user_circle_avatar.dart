import 'dart:math';
import 'package:eze/core/components/app_cached_network_image.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class UserCircleAvatar extends StatefulWidget {
  final double? size;
  final bool showName;
  final String? image;
  final Color? color;

  final String username;

  const UserCircleAvatar._({
    this.size,
    this.image,
    this.color,
    required this.username,
    this.showName = false,
  });

  factory UserCircleAvatar({
    double? size,
    required String username,
    String? image,
    Color? color,
  }) => UserCircleAvatar._(
    size: size,
    image: image,
    username: username,
    color: color,
  );

  factory UserCircleAvatar.withName({
    double? size,
    String? image,
    Color? color,
    required String username,
  }) => UserCircleAvatar._(
    size: size,
    showName: true,
    username: username,
    color: color,
    image: image,
  );

  @override
  State<UserCircleAvatar> createState() => _UserCircleAvatarState();
}

class _UserCircleAvatarState extends State<UserCircleAvatar> {
  late final Color randomColor;

  @override
  void initState() {
    super.initState();
    randomColor = widget.color ??  AppColors
        .randomDarkColors[Random().nextInt(AppColors.randomDarkColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size ?? UISizes.sp72;
    return Column(
      spacing: size * .01,
      children: [
        _buildAvatar(size, randomColor),
        if (widget.showName)
          Expanded(
            child: SizedBox(
              width: size,
              child: AppText(
                widget.username.split(" ").first,
                textAlign: TextAlign.center,
                height: 0,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontSize: size * .2,
                style: context.textTheme.labelSmall,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildChar(double size, Color randomColor) {
    final String userName = widget.username;
    final String firstLetter = userName[0];
    return Builder(
      builder: (context) {
        return Transform.translate(
          offset: Offset(0, size * .1),
          child: AppText(
            firstLetter.toUpperCase(),
            textAlign: TextAlign.center,
            style: context.textTheme.labelMedium?.copyWith(
              fontSize: size * .5,
              height: 0,
              color: randomColor,
            ),
          ),
        );
      },
    );
  }

  Widget _buildAvatar(double size, Color randomColor) {
    if (widget.image == null) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: randomColor.lighten(0.4),
        ),
        child: Center(child: _buildChar(size, randomColor)),
      );
    }
    return ClipOval(
      child: AppCachedNetworkImage(width: size, height: size, widget.image),
    );
  }
}
