import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/enums/social_media.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _SocialButton extends StatelessWidget {
  final Widget? svgIcon;
  final String title;
  final VoidCallback onTap;

  const _SocialButton({required this.onTap, required this.title, this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      fixedSize: Size(double.infinity, UISizes.h48),
      color: AppColors.white,
      child: Row(
        spacing: UISizes.w8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIconText(
            color: Colors.black,
            textStyle: context.textTheme.bodySmall,
            customIcon: svgIcon ,
            text: title,
          ),
          Icon(AppIcons.arrowForward, size: UISizes.sp14,)
        ],
      ),
    );
  }
}

class LoginWithSocialMedia extends StatelessWidget {
  final SocialMedia socialMediaType;
  final GestureTapCallback onTap;

  const LoginWithSocialMedia({
    super.key,
    required this.onTap,
    required this.socialMediaType,
  });

  @override
  Widget build(BuildContext context) {
    return _SocialButton(
      onTap: onTap,
      svgIcon: SvgPicture.asset(socialMediaType.svgPath, width: UISizes.sp28,height: UISizes.sp28,),
      title: " مواصلة باستخدام ${socialMediaType.title}",
    );
  }
}
class LoginWithPhoneNumber extends StatelessWidget {
  final GestureTapCallback onTap;
  const LoginWithPhoneNumber({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _SocialButton(onTap: onTap, title: "المواصلة برقم الهاتف");
  }
}
