import 'dart:ui';

class AppColors {
  const AppColors._();
  // ─── Primary ───────────────────────────────────────────
  static const Color primary100 = Color(0xFFE6D9FF);
  static const Color primary200 = Color(0xFFCDB3FF);
  static const Color primary300 = Color(0xFFB38CFF);
  static const Color primary400 = Color(0xFF8A4DFF);
  static const Color primary500 = Color(0xFF5501FD);
  static const Color primary600 = Color(0xFF4D01E4);
  static const Color primary700 = Color(0xFF4301C7);
  static const Color primary800 = Color(0xFF3901AA);
  static const Color primary900 = Color(0xFF2D0186);
  static const Color primary = primary500;
  // ─── Secondary ─────────────────────────────────────────
  static const Color secondary100 = Color(0xFFD9F7FF);
  static const Color secondary200 = Color(0xFFB3EFFF);
  static const Color secondary300 = Color(0xFF80E5FF);
  static const Color secondary400 = Color(0xFF40D4FF);
  static const Color secondary500 = Color(0xFF01C3FE);
  static const Color secondary600 = Color(0xFF01B0E5);
  static const Color secondary700 = Color(0xFF0199C7);
  static const Color secondary800 = Color(0xFF017FA6);
  static const Color secondary900 = Color(0xFF016885);
  static const Color secondary = secondary500;

  // ─── Tertiary ─────────────────────────────────────────

  static const Color tertiary100 = Color(0xFFFFF8D9);
  static const Color tertiary200 = Color(0xFFFFF0B3);
  static const Color tertiary300 = Color(0xFFFFE680);
  static const Color tertiary400 = Color(0xFFFEDF40);
  static const Color tertiary500 = Color(0xFFFDD901);
  static const Color tertiary600 = Color(0xFFE4C301);
  static const Color tertiary700 = Color(0xFFC7AB01);
  static const Color tertiary800 = Color(0xFFAA9201);
  static const Color tertiary900 = Color(0xFF867401);
  static const Color tertiary = tertiary500;
  // ─── Grey ──────────────────────────────────────────────
  static const Color white = Color(0xffFFFFFF);
  static const Color grey50 = Color(0xffFAFAFA);
  static const Color grey100 = Color(0xFFECECEC);
  static const Color grey200 = Color(0xFFE5E5E5);
  static const Color grey300 = Color(0xFFD4D4D4);
  static const Color grey400 = Color(0xFFA3A3A3);
  static const Color grey500 = Color(0xFF5E5E5E);
  static const Color grey600 = Color(0xFF525252);
  static const Color grey700 = Color(0xFF404040);
  static const Color grey800 = Color(0xFF262626);
  static const Color grey900 = Color(0xFF171717);
  static const Color black = Color(0xff000000);
  static const Color grey = grey500;
  // ─── Success ───────────────────────────────────────────
  static const Color success100 = Color(0xFFE6F7EA);
  static const Color success200 = Color(0xFFC3EBCB);
  static const Color success300 = Color(0xFF97DBA6);
  static const Color success400 = Color(0xFF6BC87F);
  static const Color success500 = Color(0xFF45B563);
  static const Color success600 = Color(0xFF2F9C4C);
  static const Color success700 = Color(0xFF24803D);
  static const Color success800 = Color(0xFF1C6631);
  static const Color success900 = Color(0xFF154D25);
  static const Color success = success600;

  // ─── Info ──────────────────────────────────────────────
  static const Color info100 = Color(0xFFDCE8FD);
  static const Color info200 = Color(0xFFB8D0FC);
  static const Color info300 = Color(0xFF8CB4F8);
  static const Color info400 = Color(0xFF4D86F2);
  static const Color info500 = Color(0xFF145DEA);
  static const Color info600 = Color(0xFF1254D3);
  static const Color info700 = Color(0xFF1048B8);
  static const Color info800 = Color(0xFF0D3D9C);
  static const Color info900 = Color(0xFF0A317D);
  static const Color info = info500;
  // ─── Warning ───────────────────────────────────────────
  static const Color warning100 = Color(0xffFFFBEB);
  static const Color warning200 = Color(0xffFEF3C7);
  static const Color warning300 = Color(0xffFDE68A);
  static const Color warning400 = Color(0xffFBBF24);
  static const Color warning500 = Color(0xffF59E0B);
  static const Color warning600 = Color(0xffD97706);
  static const Color warning700 = Color(0xffB45309);
  static const Color warning800 = Color(0xff92400E);
  static const Color warning900 = Color(0xff78350F);
  static const Color warning = warning500;
  static const Color gold = Color(0xfffab700);
  // ─── Error ─────────────────────────────────────────────
  static const Color error100 = Color(0xffFEDDCB);
  static const Color error200 = Color(0xffFEB398);
  static const Color error300 = Color(0xffFE8065);
  static const Color error400 = Color(0xffFE503F);
  static const Color error500 = Color(0xffFE0000);
  static const Color error600 = Color(0xffDA0012);
  static const Color error700 = Color(0xffB6001F);
  static const Color error800 = Color(0xff930026);
  static const Color error900 = Color(0xff79002A);
  static const Color error = error500;

  // ─── Main Colors ───────────────────────────
  static const List<Color> mainColors = [
    primary,
    secondary,
    tertiary,
    warning,
    error,
    success,
  ];
  static const List<Color> mainDarkColors = [
    primary700,
    info700,
    warning700,
    error700,
    success700,
    grey700,
  ];
}
