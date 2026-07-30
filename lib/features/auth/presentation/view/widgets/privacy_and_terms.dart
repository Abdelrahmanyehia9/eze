import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PrivacyAndTerms extends StatefulWidget {
  const PrivacyAndTerms({
    super.key,
    required this.onTermsTapped,
    required this.onPrivacyTapped,
  });

  final VoidCallback onTermsTapped;
  final VoidCallback onPrivacyTapped;

  @override
  State<PrivacyAndTerms> createState() => _PrivacyAndTermsState();
}

class _PrivacyAndTermsState extends State<PrivacyAndTerms> {
  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = widget.onTermsTapped;
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = widget.onPrivacyTapped;
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = context.textTheme.bodySmall?.copyWith(
      color: AppColors.white,
      height: 0
    );

    final linkStyle = baseStyle?.copyWith(
      decoration: TextDecoration.underline,
      fontWeight: FontWeightHelper.bold
    );

    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        style: baseStyle,
        text: "بالتسجيل، أنت توافق على ",
        children: [
          TextSpan(
            text: "شروطنا",
            style: linkStyle,
            recognizer: _termsRecognizer,
          ),
          const TextSpan(text: "، وتعرف على كيفية استخدامنا لبياناتك في "),
          TextSpan(
            text: "سياسة الخصوصية",
            style: linkStyle,
            recognizer: _privacyRecognizer,
          ),
        ],
      ),
    );
  }
}