import 'package:flutter/material.dart';

class AppWidgetOverlay extends StatelessWidget {
  final Widget child;
  final List<(AlignmentGeometry, Widget)>? overlay;
  final Clip clipBehavior;

  const AppWidgetOverlay({
    super.key,
    required this.child,
    this.overlay,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: clipBehavior,
      children: [
        child,
        if (overlay != null)
          for (final item in overlay!)
            Positioned.fill(
              child: Align(alignment: item.$1, child: item.$2),
            ),
      ],
    );
  }
}
