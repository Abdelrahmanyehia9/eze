import 'dart:math';

import 'package:eze/core/components/app_cached_network_image.dart';
import 'package:eze/core/components/app_logo.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CoverProfile extends StatefulWidget {
  final double height ;
  final String? cover ;
  const CoverProfile(this.cover, {super.key,  required this.height});

  @override
  State<CoverProfile> createState() => _CoverProfileState();
}

class _CoverProfileState extends State<CoverProfile> {
  late final Color randomColor;

  @override
  void initState() {
    super.initState();
    randomColor =  AppColors
        .mainColors[Random().nextInt(AppColors.mainColors.length)];
  }


  @override
  Widget build(BuildContext context) {
    final width = context.width ;
    return AppCachedNetworkImage(
      width: width,
      height: widget.height,
      widget.cover,
      placeholder: _placeHolderCover(width, widget.height),
    );
  }

  Widget _placeHolderCover(double width, double height) => ColoredBox(
      color: randomColor,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(child: AppLogo(size: height * .5)),
      ),
    );
}
