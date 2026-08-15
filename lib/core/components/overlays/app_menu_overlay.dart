import 'package:flutter/material.dart';

class AppMenuOverlay extends StatelessWidget {
  final List<Widget> children;
  final Widget child;
  final Offset? offset;
  final MenuStyle? style;
  final MenuController? controller;
  final Widget Function(
    BuildContext context,
    MenuController controller,
    Widget? child,
  )?
  builder;
  const AppMenuOverlay({
    super.key,
    this.style,
    this.offset,
    this.controller,
    required this.child,
    required this.children,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: controller,
      menuChildren: children,
      animated: true,
      style: style,
      alignmentOffset: offset,
      builder: builder,
      child: child,
    );
  }
}
