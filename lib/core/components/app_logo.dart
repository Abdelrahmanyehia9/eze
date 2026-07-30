import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  final double? size  ;
  final Color? color ;
  final BlendMode colorBlendMode ;
  const AppLogo({super.key,this.size, this.color = AppColors.white, this.colorBlendMode = BlendMode.srcIn});

  @override
  Widget build(BuildContext context) {
    final double size = this.size ?? UISizes.sp60 ;
    return Center(
      child: SvgPicture.asset(AppAssets.logo,
        width: size,
        height: size,
        fit: BoxFit.scaleDown,
        colorFilter: color != null ? ColorFilter.mode(color!, colorBlendMode) : null,
      ),
    );
  }
}
