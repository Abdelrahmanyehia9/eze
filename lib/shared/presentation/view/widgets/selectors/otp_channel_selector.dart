import 'package:eze/core/components/app_ribbon.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/enums/otp_channel.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_gradients.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/selector_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtpChannelSelector extends StatelessWidget {
  final List<OtpChannel> channels;

  const OtpChannelSelector({super.key, required this.channels});

  @override
  Widget build(BuildContext context) {
    return SelectorBottomSheet(
      title: "اختر المزود",
      header: AppText(
        "اختر الوسيلة المتاحة التي تفضل استلام رمز التحقق (OTP) من خلالها.",
        style: context.textTheme.bodySmall,
        color: context.colors.surfaceContainer,
      ),
      data: channels
          .map(
            (e) => SelectorBottomSheetData<OtpChannel>(
              title: e.text,
              id: e,
              ribbon: otpVerifyRibbon(e),
              leading: e.svg != null
                  ? SvgPicture.asset(e.svg!, width: UISizes.sp24)
                  : null,
            ),
          )
          .toList(),
    );
  }

  RibbonData? otpVerifyRibbon(OtpChannel ch) => switch (ch) {
    OtpChannel.whatsapp => RibbonData(
      text: "مُستَحسَن",
      gradient: AppGradients.primary,
    ),
    _ => null,
  };
}
