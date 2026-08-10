import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLottie extends StatelessWidget {
  final String path;
  final bool repeat;
  final double? width;

  const AppLottie(this.path, {super.key, this.width, this.repeat = true});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      path,
      width: width,
      repeat: repeat,
      addRepaintBoundary: true,
    );
  }
}
