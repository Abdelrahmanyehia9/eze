

import 'package:eze/core/routing/routes.dart';
import 'package:eze/features/auth/presentation/view/auth_screen.dart';
import 'package:eze/features/auth/presentation/view/otp_verification_screen.dart';
import 'package:eze/features/auth/presentation/view/phone_login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {

Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash :
        return _page(AuthScreen(),name:  Routes.splash) ;
      case Routes.phoneLogin :
        return _page(PhoneLoginScreen(), name: Routes.phoneLogin) ;
      case Routes.otpVerification:
        final OtpVerificationArgs args = settings.arguments as OtpVerificationArgs ;
        return _page(OtpVerificationScreen(args: args,), name: Routes.otpVerification);

      default : 
       return null ; 


    }
}

// ignore: unused_element
MaterialPageRoute _page(Widget child, {String? name}) => MaterialPageRoute(
    builder: (_) => child,
    settings: RouteSettings(name: name),
  );
}