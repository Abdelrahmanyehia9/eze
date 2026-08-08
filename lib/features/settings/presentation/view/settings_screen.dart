import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_switch.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/presentation/controller/profile_cubit.dart';
import 'package:eze/features/settings/data/model/settings_details_screen_args.dart';
import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/presentation/controller/settings_cubit.dart';
import 'package:eze/features/settings/presentation/view/layout/blocked_users_list.dart';
import 'package:eze/features/settings/presentation/view/layout/languages_list.dart';
import 'package:eze/features/settings/presentation/view/layout/chat_feature_list.dart';
import 'package:eze/features/settings/presentation/view/setting_details_screen.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_profile.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_theme.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

part 'widgets/settings_profile_overview.dart';

part 'widgets/settings_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const DefaultAppBar(),
      body: BaseBlocConsumer<SettingsCubit, SettingsEntity>(
        successBuilder: (settings) => _SettingsScreenBody(settings),
        loadingBuilder: () => _SettingsScreenBody(SettingsEntity.fake()),
      ),
    );
  }
}

class _SettingsScreenBody extends StatelessWidget {
  final SettingsEntity settings;

  const _SettingsScreenBody(this.settings);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: UISizes.h16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SettingsProfileOverview(),
          BaseBlocConsumer<ProfileCubit, ProfileEntity>(
            successBuilder: (p) => _buildAccountSection(context, p),
          ),
          _buildAppSettingsSection(context),
          _buildAboutAppSection(),
          _buildSupportSection(),
          _buildVersion(),
        ],
      ),
    );
  }

  _SettingsSection _buildAccountSection(
    BuildContext context,
    ProfileEntity entity,
  ) => _SettingsSection(
    header: "الحساب",
    data: [
      _SettingTileData(
        title: "المعلومات الشخصية",
        subTitle: "الاسم ,تاريخ الميلاد,الجنس ... الخ",
        iconData: AppIcons.profileCircle,
        onTap: () => context.pushNamed(
          Routes.settingDetails,
          arguments: SettingDetailsScreenArgs(
            title: "الملف الشخصى ",
            body: SettingsProfile(profile: entity),
          ),
        ),
      ),
      _SettingTileData(
        title: "عناصر التحكم",
        iconData: AppIcons.control,
        onTap: () => context.pushNamed(
          Routes.settingDetails,
          arguments: SettingDetailsScreenArgs(
            title: "عناصر التحكم",
            info:
                "تحكّم في الميزات الحصرية للتطبيق لتخصيص تجربتك والاستفادة من الإمكانيات التي تناسب أسلوب استخدامك.",
            body: ChatFeaturesList(features: settings.sysControl.features),
          ),
        ),
      ),
      _SettingTileData(
        title: "الحسابات المحظورة ",
        iconData: AppIcons.block,
        customTrailing: AppIconText(
          reverse: true,
          text: "15",
          iconSize: UISizes.sp18,
          icon: AppIcons.arrowForward,
        ),
        onTap: () => context.pushNamed(
          Routes.settingDetails,
          arguments: SettingDetailsScreenArgs(
            title: "الحسابات المحظورة",
            info:
                "الحسابات التي منعت تواصلها معك، ويمكنك إلغاء الحظر عنها متى شئت.",
            body: const BlockedUsersList(),
          ),
        ),
      ),
    ],
  );

  _SettingsSection _buildAppSettingsSection(
    BuildContext context,
  ) => _SettingsSection(
    header: "الاعدادات",
    data: [
      _SettingTileData(
        title: "الاشعارات ",
        iconData: AppIcons.notification,
        customTrailing: AppSwitch(
          value: settings.enabledNotification,
          onChanged: (_) {},
        ),
      ),
      _SettingTileData(
        title: "السمة",
        subTitle: "تخصيص الدردشة وسمة التطبيق",
        iconData: AppIcons.paintBrush,
        onTap: () => context.pushNamed(
          Routes.settingDetails,
          arguments: SettingDetailsScreenArgs(
            title: "السمة",
            info:
                "تحكم في مظهر التطبيق بالكامل، بما في ذلك السمة، وألوان الدردشات، والخطوط، وغيرها من خيارات التخصيص، لتصميم تجربة تناسب ذوقك.",
            body: SettingsTheme(theme: settings.theme),
          ),
        ),
      ),
      _SettingTileData(
        title: "لغة التطبيق",
        iconData: AppIcons.translate,
        customTrailing: AppIconText(
          reverse: true,
          text: settings.locale.title,
          icon: AppIcons.arrowForward,
          iconSize: UISizes.sp18,
        ),
        onTap: () => context.pushNamed(
          Routes.settingDetails,
          arguments: SettingDetailsScreenArgs(
            title: "اللغة",
            body: const LanguagesList(),
            info:
                "غيّر لغة واجهة التطبيق واختر اللغة التي تناسبك لتجربة استخدام أكثر راحة وسهولة.",
          ),
        ),
      ),
    ],
  );

  _SettingsSection _buildAboutAppSection() => _SettingsSection(
    header: "حول التطبيق",
    data: [
      _SettingTileData(title: "عن التطبيق ", iconData: AppIcons.info),
      _SettingTileData(
        title: "سياسة الخصوصية",
        iconData: AppIcons.privacyPolicy,
      ),
    ],
  );

  _SettingsSection _buildSupportSection() => _SettingsSection(
    header: "الدعم والمساعدة",
    data: [_SettingTileData(title: "تحدث معنا", iconData: AppIcons.support)],
  );

  Widget _buildVersion() => Builder(
    builder: (context) {
      return AppText(
        "نسخة 1.0.0",
        style: context.textTheme.bodyMedium,
        color: context.colors.surfaceContainer,
      );
    },
  );
}
