import 'dart:ui';

enum Rank {
  bronze,
  silver,
  gold,
  platinum,
  elite;

  String get title => switch (this) {
    bronze => "برونزى",
    silver => "فضي",
    gold => "ذهبي",
    platinum => "بلاتنيوم",
    elite => "ايليت",
  };
  Color get color => switch (this) {
    bronze => const Color(0xff603604),
    silver => const Color(0xffacacac),
    gold => const Color(0xffdaaf04),
    platinum => const Color(0xff43b9d4),
    elite => const Color(0xff5f1bd6),
  };
}
