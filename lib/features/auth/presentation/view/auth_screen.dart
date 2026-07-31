
library ;
import 'package:eze/core/components/app_logo.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_assets.dart';
import 'package:eze/features/auth/presentation/view/widgets/privacy_and_terms.dart';
import 'package:eze/features/auth/presentation/view/widgets/social_buttons.dart';
import 'package:eze/shared/presentation/view/widgets/avatar_glow.dart';
import 'package:flutter/material.dart';
part 'layout/auth_screen_layout.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _AuthScreenLayout(
        authButtons: [
          LoginWithSocialMedia.google(),
          LoginWithSocialMedia.apple(),
          LoginWithPhoneNumber()
        ],
        privacyAgree: PrivacyAndTerms().paddingVr,
      ),
    );
  }
}
