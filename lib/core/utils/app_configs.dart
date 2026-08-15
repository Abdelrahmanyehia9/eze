import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';

class AppConfigs {
  static final Country country = Country.parse("EG");
  const AppConfigs._();

  static Future<void> init() async {
    await Future.wait([_setupPhoneSystem()]);
  }

  static const List<String> reactEmojis = ["👍", "❤️", "😭", "😮", "😡"];

  static Future<void> _setupPhoneSystem() async {
    await Future.wait([
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge),
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
      ),
    );
  }
}
