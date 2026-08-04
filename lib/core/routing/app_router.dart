import 'package:eze/core/di/get_it.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/features/auth/presentation/view/otp_verification_screen.dart';
import 'package:eze/features/auth/presentation/view/phone_login_screen.dart';
import 'package:eze/features/chat/presentation/view/chat_screen.dart';
import 'package:eze/features/intro/presentation/view/splash_screen.dart';
import 'package:eze/features/profile/presentation/view/profile_screen.dart';
import 'package:eze/features/settings/presentation/view/setting_details_screen.dart';
import 'package:eze/features/settings/presentation/view/settings_screen.dart';
import 'package:eze/shared/presentation/controllers/main_layout_cubit.dart';
import 'package:eze/shared/presentation/view/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _page(const SplashScreen(), name: Routes.splash);
      case Routes.phoneLogin:
        return _page(const PhoneLoginScreen(), name: Routes.phoneLogin);
      case Routes.otpVerification:
        final OtpVerificationArgs args =
            settings.arguments as OtpVerificationArgs;
        return _page(
          OtpVerificationScreen(args: args),
          name: Routes.otpVerification,
        );
      case Routes.main:
        return _page(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<MainLayoutCubit>()),
            ],
            child: const MainLayout(),
          ),
          name: Routes.main,
        );

      case Routes.profile:
        return _page(const ProfileScreen(), name: Routes.profile);
      case Routes.settings:
        return _page(const SettingsScreen(), name: Routes.settings);
      case Routes.chat :
        return _page(const ChatScreen(), name: Routes.chat);
      case Routes.settingDetails :
        final args = settings.arguments as SettingDetailsScreenArgs ;
        return _page( SettingDetailsScreen(args: args), name: Routes.settingDetails) ;
      default:
        return null;
    }
  }

  // ignore: unused_element
  MaterialPageRoute _page(Widget child, {String? name}) => MaterialPageRoute(
    builder: (_) => child,
    settings: RouteSettings(name: name),
  );
}
