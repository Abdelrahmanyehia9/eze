import 'package:flutter/material.dart';

enum SwipeDirection {
  start,
  end;

  bool get isStart => this == start;
}

class AppClick extends StatefulWidget {
  final Widget child;

  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongPress;
  final GestureTapCallback? onDoubleTap;

  final void Function(TapUpDetails)? onTapUp;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(SwipeDirection direction)? onHorizontalSwipe;

  final bool enabled;

  const AppClick({
    super.key,
    required this.child,
    this.enabled = true,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapUp,
    this.onTapDown,
    this.onHorizontalSwipe,
  });

  @override
  State<AppClick> createState() => _AppClickState();
}

class _AppClickState extends State<AppClick> {
  double _scale = 1;

  void _press() {
    if (widget.onTap == null) return;

    if (widget.enabled) {
      setState(() => _scale = .96);
    }
  }

  void _release() {
    if (widget.onTap == null) return;

    if (widget.enabled) {
      setState(() => _scale = 1);
    }
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (!widget.enabled || widget.onHorizontalSwipe == null) return;

    final velocity = details.primaryVelocity ?? 0;

    if (velocity == 0) return;

    widget.onHorizontalSwipe!(
      velocity < 0 ? SwipeDirection.start : SwipeDirection.end,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTapDown: (details) {
        _press();
        widget.onTapDown?.call(details);
      },

      onTapUp: (details) {
        _release();
        widget.onTapUp?.call(details);
      },

      onTapCancel: _release,

      onTap: widget.enabled ? widget.onTap : null,
      onDoubleTap: widget.enabled ? widget.onDoubleTap : null,
      onLongPress: widget.enabled ? widget.onLongPress : null,

      onHorizontalDragEnd: widget.enabled ? _onHorizontalDragEnd : null,

      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
