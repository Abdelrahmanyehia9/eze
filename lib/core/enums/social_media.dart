import 'package:eze/core/utils/app_assets.dart';

enum SocialMedia {
  google,
  facebook,
  apple;

  String get svgPath => switch (this) {
    google => AppAssets.googleSvg,
    apple => AppAssets.appleSvg,
    facebook => AppAssets.faceBookSvg,
  };
  String get title => switch (this) {
    google => "جوجل",
    apple => "ابل",
    facebook => "فيسبوك",
  };
}
