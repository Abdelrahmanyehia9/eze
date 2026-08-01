import 'package:flutter/services.dart';

class AppConfigs {
  const AppConfigs._();

  static Future<void> init() async {
    await Future.wait([_setupPhoneSystem()]);
  }

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
