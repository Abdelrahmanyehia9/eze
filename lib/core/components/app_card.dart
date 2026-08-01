import 'package:eze/core/extensions/widgets.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final double paddingHr, paddingVr;
  final Widget child;
  final Color? color;

  const AppCard({
    super.key,
    this.paddingHr = 16,
    this.paddingVr = 16,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: child.appPaddingVr(paddingVr).appPaddingHr(paddingHr),
    );
  }
}
