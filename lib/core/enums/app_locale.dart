import 'package:eze/core/utils/app_assets.dart';

enum AppLocale {
  ar,
  en;

  String get svg => switch (this) {
    en => AppAssets.gbFlag,
    ar => AppAssets.saFlag,
  };

  String get title => switch (this) {
    en => "English",
    ar => "العربية",
  };
}
