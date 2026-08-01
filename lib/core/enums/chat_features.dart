import 'package:eze/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

enum ChatFeatures {
  autoTranslate,
  ghostMode;

  String? get svg => switch (this) {
    autoTranslate => AppAssets.translateSvg,
    ghostMode => AppAssets.ghostSvg,
  };
  String get title => switch (this) {
    autoTranslate => "الترجمة التلقائية",
    ghostMode => "وضع التخفى",
  };
  String? get description => switch (this) {
    autoTranslate => "ترجمة فورية للرسائل بجميع اللغات واللهجات.",

    ghostMode => "أخفِ حالة نشاطك واستمتع بخصوصية أكبر.",
  };
  Color get color => switch (this) {
    autoTranslate => Colors.red,
    ghostMode => Colors.black,
  };
}
