import 'dart:async';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/app_timer.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:flutter/material.dart';


class OtpCountDownController {
  final int duration;
  final int maxAttempts;

  OtpCountDownController({this.duration = 60, this.maxAttempts = 3});
  final ValueNotifier<int> seconds = ValueNotifier(0);
  late final ValueNotifier<int> attemptsLeft = ValueNotifier(maxAttempts);
  AppTimer? _timer;
  bool get isFinished => seconds.value == 0;
  bool get hasAttemptsLeft => attemptsLeft.value > 0;


  void start() {
    _timer?.cancel();
    _timer = AppTimer(
      duration: duration,
      onTick: () {
        seconds.value = _timer!.remainingSeconds;
      },
      onFinish: () {
        seconds.value = 0;
      },
    );
    seconds.value = duration;
    _timer!.start();
  }

  void resend() {
    if (!hasAttemptsLeft) return;
    attemptsLeft.value--;
    if (attemptsLeft.value <= 0) return;
    start();
  }

  void dispose() {
    _timer?.cancel();
    seconds.dispose();
    attemptsLeft.dispose();
  }
}

class OtpColdDown extends StatefulWidget {
  final VoidCallback? onResend;
  final OtpCountDownController? controller;

  const OtpColdDown({super.key, this.onResend, this.controller});

  @override
  State<OtpColdDown> createState() => _OtpColdDownState();
}

class _OtpColdDownState extends State<OtpColdDown> {
  late final OtpCountDownController _controller;
  late final bool _isInternalController;

  @override
  void initState() {
    super.initState();
    _isInternalController = widget.controller == null;
    _controller = widget.controller ?? OtpCountDownController();
    _controller.start();
  }

  void _onResend() {
    widget.onResend?.call();
    _controller.resend();
  }

  @override
  void dispose() {
    if (_isInternalController) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        _controller.seconds,
        _controller.attemptsLeft,
      ]),
      builder: (context, _) {
        if (!_controller.hasAttemptsLeft) return _maxAttemptsReached();
        return _controller.isFinished ? _notReceiveCode() : _remaining();
      },
    );
  }

  Widget _notReceiveCode() {
    return Row(
      spacing: UISizes.w4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText("لم تستلم رمز التحقق؟", style: context.textTheme.bodySmall,),
        AppClick(
          onTap: _onResend,
          child: AppText(
            "إعادة إرسال الرمز",
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colors.primary,
              decoration: TextDecoration.underline,
              decorationColor: context.colors.primary,
            ),
          ),
        ),
      ],
    );
  }
  Widget _remaining() {
    final minutes =
    (_controller.seconds.value ~/ 60).toString().padLeft(2, '0');
    final seconds =
    (_controller.seconds.value % 60).toString().padLeft(2, '0');

    return Text.rich(
      textAlign: TextAlign.center,
      style: context.textTheme.bodySmall,
      TextSpan(
        text: "يمكنك إعادة إرسال الرمز خلال ",
        children: [
          TextSpan(
            text: '$minutes:$seconds',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }
  Widget _maxAttemptsReached() => AppText(
    'لقد وصلت إلى الحد الأقصى لمحاولات إعادة إرسال الرمز.',
    textAlign: TextAlign.center,
    style: context.textTheme.labelSmall,
    fontSize: UISizes.sp16,
    color: context.colors.error,
  );
}