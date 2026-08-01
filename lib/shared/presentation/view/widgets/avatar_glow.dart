import 'dart:math' as math;

import 'package:eze/core/extensions/color.dart';
import 'package:flutter/material.dart';

class AvatarGlow extends StatefulWidget {
  const AvatarGlow({
    super.key,
    required this.child,
    this.glowColor = Colors.white,
    this.startRadius = 40,
    this.endRadius = 80,
    this.duration = const Duration(milliseconds: 5000),
    this.delay = Duration.zero,
    this.repeat = true,
    this.showTwoGlows = true,
    this.curve = Curves.easeOut,
    this.glowOpacity = 0.35,
    this.animate = true,
  });

  final Widget child;
  final Color glowColor;
  final double startRadius;
  final double endRadius;
  final Duration duration;
  final Duration delay;
  final bool repeat;
  final bool showTwoGlows;
  final Curve curve;
  final double glowOpacity;
  final bool animate;

  @override
  State<AvatarGlow> createState() => _AvatarGlowState();
}

class _AvatarGlowState extends State<AvatarGlow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _showGlow = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _startAnimation();
  }

  void _startAnimation() {
    if (!widget.animate) return;

    if (widget.delay == Duration.zero) {
      setState(() => _showGlow = true);
      widget.repeat ? _controller.repeat() : _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (!mounted) return;
        setState(() => _showGlow = true);
        widget.repeat ? _controller.repeat() : _controller.forward();
      });
    }
  }

  @override
  void didUpdateWidget(covariant AvatarGlow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      if (widget.animate) {
        _startAnimation();
      } else {
        _controller.stop();
      }
    }
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _ring(double progress) {
    final t = widget.curve.transform(progress);
    final radius =
        widget.startRadius + (widget.endRadius - widget.startRadius) * t;
    final opacity = (math.sin(math.pi * progress) * widget.glowOpacity).clamp(
      0.0,
      widget.glowOpacity,
    );

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.glowColor.withAppOpacity(opacity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final maxDiameter = widget.endRadius * 2;

    return SizedBox(
      width: maxDiameter,
      height: maxDiameter,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, _) {
          final progress = _controller.value;
          final secondProgress = (progress + 0.5) % 1.0;

          return Stack(
            alignment: Alignment.center,
            children: [
              if (_showGlow && widget.showTwoGlows) _ring(secondProgress),
              if (_showGlow) _ring(progress),
              widget.child,
            ],
          );
        },
      ),
    );
  }
}
