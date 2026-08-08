import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

enum ChatFeature {
  autoTranslate,
  privacyMode,
  ghostMode,
  boost;

  String? get svg => switch (this) {
    autoTranslate => AppAssets.translateSvg,
    ghostMode => AppAssets.ghostSvg,
    privacyMode => AppAssets.shieldSvg,
    boost => AppAssets.rocketSvg,
  };
  String get title => switch (this) {
    autoTranslate => "الترجمة التلقائية",
    ghostMode => "وضع التخفى",
    privacyMode => "وضع الخصوصية",
    boost => "تعزيز الظهور",
  };
  String? get description => switch (this) {
    autoTranslate => "ترجمة فورية للرسائل بجميع اللغات واللهجات.",
    ghostMode => "أخفِ حالة نشاطك واستمتع بخصوصية أكبر.",
    privacyMode => "امنع أعضاء المجموعات من إرسال رسائل خاصة إليك.",
    boost => "عزّز ظهور ملفك الشخصي داخل الدردشات.",
  };
  Color color(BuildContext context) => switch (this) {
    autoTranslate => Colors.red,
    ghostMode => context.colors.surfaceContainerHighest,
    privacyMode => AppColors.info,
    boost => AppColors.success600,
  };
}
