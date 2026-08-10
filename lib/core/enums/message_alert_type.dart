import 'package:eze/core/utils/app_assets.dart';

enum MessagesAlertType {
  profileCompleted;

  String get lottie => switch (this) {
    _ => AppAssets.successLottie,
  };

  String get title => switch (this) {
    _ => "تم اكتمال الملف الشخصي بنجاح",
  };

  String get subtitle => switch (this) {
    _ =>
    " مبروك! تم اكتمال ملفك الشخصي بنجاح.أصبحت جاهزًا الآن لاكتشاف تجربة مميزة والتواصل مع الآخرين والاستمتاع بكل ما يقدمه التطبيق.",
  };
}
