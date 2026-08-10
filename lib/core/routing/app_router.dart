import 'package:eze/core/di/get_it.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/features/auth/data/models/otp_verification_screen_args.dart';
import 'package:eze/features/auth/presentation/view/auth_screen.dart';
import 'package:eze/features/auth/presentation/view/complete_profile_screen.dart';
import 'package:eze/features/auth/presentation/view/otp_verification_screen.dart';
import 'package:eze/features/auth/presentation/view/phone_login_screen.dart';
import 'package:eze/features/chat/presentation/controller/chat_by_id_cubit.dart';
import 'package:eze/features/chat/presentation/view/chat_requests_screen.dart';
import 'package:eze/features/chat/presentation/view/chat_screen.dart';
import 'package:eze/features/intro/presentation/view/splash_screen.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/presentation/controller/profile_cubit.dart';
import 'package:eze/features/profile/presentation/view/profile_gallery_screen.dart';
import 'package:eze/features/profile/presentation/view/profile_screen.dart';
import 'package:eze/features/settings/data/model/settings_details_screen_args.dart';
import 'package:eze/features/settings/data/model/settings_screen_args.dart';
import 'package:eze/features/settings/presentation/view/setting_details_screen.dart';
import 'package:eze/features/settings/presentation/view/settings_screen.dart';
import 'package:eze/shared/data/models/result_screen_args.dart';
import 'package:eze/shared/data/models/typed_media_model.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';
import 'package:eze/shared/presentation/controllers/main_layout_cubit.dart';
import 'package:eze/shared/presentation/view/main_layout.dart';
import 'package:eze/shared/presentation/view/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _page(const SplashScreen(), name: Routes.splash);
      case Routes.auth:
        return _page(const AuthScreen(), name: Routes.auth);
      case Routes.phoneLogin:
        return _page(const PhoneLoginScreen(), name: Routes.phoneLogin);
      case Routes.otpVerification:
        final OtpVerificationScreenArgs args =
            settings.arguments as OtpVerificationScreenArgs;
        return _page(
          OtpVerificationScreen(args: args),
          name: Routes.otpVerification,
        );
      case Routes.main:
        return _page(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<MainLayoutCubit>()),
              BlocProvider(
                create: (context) => sl<ProfileCubit>()..getProfileData(),
              ),
            ],
            child: const  MainLayout(),
          ),
          name: Routes.main,
        );

      case Routes.profile:
        final ProfileEntity profile = settings.arguments as ProfileEntity;
        return _page(ProfileScreen(profile: profile), name: Routes.profile);
      case Routes.settings:
        final SettingsScreenArgs args =
            settings.arguments as SettingsScreenArgs;
        return _page(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: args.profileCubit),
            ],
            child: const SettingsScreen(),
          ),
          name: Routes.settings,
        );
      case Routes.chat:
        final ConversationPeerEntity sender =
            settings.arguments as ConversationPeerEntity;
        return _page(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    sl<ChatByIdCubit>()..getChatById(id: sender.uid),
              ),
            ],
            child: ChatScreen(sender: sender),
          ),
          name: Routes.chat,
        );
      case Routes.settingDetails:
        final args = settings.arguments as SettingDetailsScreenArgs;
        return _page(
          SettingDetailsScreen(args: args),
          name: Routes.settingDetails,
        );

      case Routes.profileGallery:
        final List<TypedMediaModel> gallery =
            settings.arguments as List<TypedMediaModel>;
        return _page(
          ProfileGalleryScreen(gallery: gallery),
          name: Routes.profileGallery,
        );

      case Routes.chatRequests:
        final List<ConversationEntity> conv =
            settings.arguments as List<ConversationEntity>;
        return _page(
          ChatRequestsScreen(conversations: conv),
          name: Routes.chatRequests,
        );
      case Routes.completeProfile:
        return _page(
          const CompleteProfileScreen(),
          name: Routes.completeProfile,
        );
      case Routes.result:
        final ResultScreenArgs args = settings.arguments as ResultScreenArgs;
        return _page(ResultScreen(args: args), name: Routes.result);

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
