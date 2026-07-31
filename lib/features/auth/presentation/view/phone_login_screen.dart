import 'package:country_picker/country_picker.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/overlays/bottom_sheets.dart';
import 'package:eze/core/enums/otp_channel.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/features/auth/presentation/view/otp_verification_screen.dart';
import 'package:eze/shared/presentation/view/widgets/buttons/default_button.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/country_selector.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/phone_text_field.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/otp_channel_selector.dart';
import 'package:flutter/material.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  late final ValueNotifier<Country> _countryNotifier;
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _countryNotifier = ValueNotifier(Country.parse("EG"));
    super.initState();
  }

  Future<void> onSubmit() async {
    final channel = await BottomSheets.show<OtpChannel>(
      child: OtpChannelSelector(channels: OtpChannel.channelsOfVerifyPhone)
    );
    if(channel!=null && mounted){
      final args = OtpVerificationArgs(code: _countryNotifier.value.phoneCode, phone: _phoneController.text , channel: channel);
       context.pushNamed(Routes.otpVerification, arguments: args) ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBar: DefaultAppBar(title: "تسجيل برقم الهاتف", centerTitle: true),
      body: ValueListenableBuilder(
        valueListenable: _countryNotifier,
        builder: (context, country, child) {
          return Column(
            spacing: UISizes.h16,
            children: [
              CountrySelector(
                country: country,
                onChanged: (value) => _countryNotifier.value = value,
              ),
              PhoneTextField(country: country, controller: _phoneController),
              child!,
            ],
          );
        },
        child: DefaultButton(text: "متابعة", onTap: onSubmit),
      ),
    );
  }

  @override
  void dispose() {
    _countryNotifier.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
