import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/enums/otp_channel.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:eze/core/utils/app_assets.dart';
import 'package:eze/features/auth/presentation/view/widgets/otp_cold_down.dart';
import 'package:eze/shared/presentation/view/widgets/buttons/default_button.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/otp_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationArgs {
  final String code;
  final String phone;
  final OtpChannel channel;

  OtpVerificationArgs({
    required this.code,
    required this.phone,
    this.channel = OtpChannel.sms,
  });
}

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final OtpCountDownController _otpCountDownController = OtpCountDownController(
    duration: 10,
    maxAttempts: 3,
  );
  final PinInputController _otpController = PinInputController();
  Future<void>onSubmit()async{
    print(_otpController.text) ;
  }

  @override
  Widget build(BuildContext context) {
    final phone = "1501634466";
    final code = "20";
    final channel = OtpChannel.whatsapp;
    return AppScaffold(
      appBar: DefaultAppBar(),
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(AppAssets.otpIllustration, height: UISizes.h220),
            Gap.large(),
            AppText("تاكيد الهاتف المحمول", style: TextStyles.labelLarge),
            AppText(
              style: TextStyles.bodySmall,
              textAlign: TextAlign.center,
              color: context.colors.surfaceContainer,
              "أدخل رمز التحقق المكوّن من 6 أرقام الذي أرسلناه عبر ${channel.text} إلى +$code $phone.",
            ),
            OtpField(controller: _otpController, onComplete:(_)=>onSubmit(),).paddingVr,
            OtpColdDown(controller: _otpCountDownController),
            ValueListenableBuilder(
              valueListenable: _otpController.textController,
              builder: (_, otp , _) =>
                  DefaultButton(text: "تاكيد",onTap: onSubmit,
                      enabled: otp.text.length==6).paddingVr,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpCountDownController.dispose();
    super.dispose();
  }
}
