part of 'message_action.dart';

class MessageGestures extends StatefulWidget {
  final Widget child;
  final VoidCallback? onReply, onDoubleTap, onLongPress, onTap;
  const MessageGestures({
    super.key,
    required this.child,
    required this.onReply,
    this.onLongPress,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  State<MessageGestures> createState() => _MessageGesturesState();
}

class _MessageGesturesState extends State<MessageGestures>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  double _dragExtent = 0;
  double _dragStart = 0;
  bool _triggered = false;
  VoidCallback? _activeListener;

  static const double _triggerDrag = 60;
  static const double _maxDrag = 80;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails d) {
    final delta = d.delta.dx;
    setState(() {
      _dragExtent = (_dragExtent + delta).clamp(0, _maxDrag);
      if (!_triggered && _dragExtent >= _triggerDrag) {
        _triggered = true;
        HapticFeedback.mediumImpact();
      } else if (_triggered && _dragExtent < _triggerDrag) {
        _triggered = false;
      }
    });
  }

  void _onDragEnd(DragEndDetails d) {
    if (_triggered) widget.onReply?.call();
    _animateBack();
  }

  void _animateBack() {
    if (_activeListener != null) {
      _controller.removeListener(_activeListener!);
    }

    _dragStart = _dragExtent;
    _triggered = false;
    _controller.value = 0;

    _activeListener = () {
      setState(() => _dragExtent = _dragStart * (1 - _controller.value));
    };

    _controller.addListener(_activeListener!);
    _controller.forward().whenComplete(() {
      _controller.removeListener(_activeListener!);
      _activeListener = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_dragExtent / _triggerDrag).clamp(0.0, 1.0);
    final offset = _dragExtent;

    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onDoubleTap: widget.onDoubleTap,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Positioned.directional(
            textDirection: Directionality.of(context),
            end: UISizes.sp16,
            child: AnimatedScale(
              scale: 0.5 + (0.5 * progress),
              duration: const Duration(milliseconds: 80),
              child: Opacity(
                opacity: progress,
                child: const AppIconButton(icon: AppIcons.reply),
              ),
            ),
          ),
          Transform.translate(offset: Offset(offset, 0), child: widget.child),
        ],
      ),
    );
  }
}
