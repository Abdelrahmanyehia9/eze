import 'package:eze/core/utils/app_assets.dart';

enum OtpChannel {
  whatsapp,
  sms,
  telegram;

  String get text => switch (this) {
    sms => "رسالة هاتفية",
    whatsapp => "واتساب",
    telegram => "تيليجرام",
  };
  String? get svg => switch (this) {
    whatsapp => AppAssets.whatsappSvg,
    _ => null,
  };
  static List<OtpChannel> get channelsOfVerifyPhone => [whatsapp, sms];
}
