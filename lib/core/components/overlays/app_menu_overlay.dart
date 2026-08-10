import 'package:flutter/material.dart';

class AppMenuOverlay extends StatelessWidget {
  final List<Widget> children;
  final Widget child;
  final Offset? offset;
  final MenuStyle? style;
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
    required this.child,
    required this.children,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      menuChildren: children,
      animated: true,
      style: style,
      alignmentOffset: offset,
      builder: builder,
      child: child,
    );
  }
}
