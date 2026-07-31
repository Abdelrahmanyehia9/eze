import 'package:eze/core/components/app_logo.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

part '../mixin/splash_animation_mixin.dart';

part 'widgets/powered_by.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with _SplashAnimationMixin, SingleTickerProviderStateMixin {
  @override
  void initState() {
    initAnimation(vsync: this, onFinished: () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          const Spacer(),
          AppLogo(
            color: null,
            size: UISizes.sp140,
          ),
          const Spacer(),
          _PoweredBy(poweredAnim: _poweredByAnim, nexyraAnim: _nexyraAnim),
          Gap(16)
        ],
      ),
    );
  }
}
