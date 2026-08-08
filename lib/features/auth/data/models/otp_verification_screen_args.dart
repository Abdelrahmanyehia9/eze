import 'package:eze/core/enums/otp_channel.dart';

class OtpVerificationScreenArgs {
  final String code;
  final String phone;
  final OtpChannel channel;

  OtpVerificationScreenArgs({
    required this.code,
    required this.phone,
    this.channel = OtpChannel.sms,
  });
}
