import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/app_list_tile.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_switch.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/enums/settings_detail_type.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/presentation/controller/profile_cubit.dart';
import 'package:eze/features/settings/data/model/settings_details_screen_args.dart';
import 'package:eze/features/settings/presentation/controller/base_settings_cubit.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/settings_profile_overview.dart';

part 'widgets/settings_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const AppScaffold(appBar: DefaultAppBar(), body: _SettingsScreenBody());
}

class _SettingsScreenBody extends StatelessWidget {
  const _SettingsScreenBody();

  void _openDetails(
    BuildContext context, {
    required SettingDetailType type,
    ProfileEntity? profile,
  }) => context.pushNamed(
    Routes.settingDetails,
    arguments: SettingDetailsScreenArgs(type: type, profile: profile),
  );

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      spacing: UISizes.h16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SettingsProfileOverview(),
        BaseBlocConsumer<ProfileCubit, ProfileEntity>(
          successBuilder: (profile) => _accountSection(context, profile),
        ),
        _appSettingsSection(context),
        _aboutSection(),
        _supportSection(),
        _version(context),
      ],
    ),
  );

  // ───────────────────────── Account ─────────────────────────

  _SettingsSection _accountSection(
    BuildContext context,
    ProfileEntity profile,
  ) => _SettingsSection(
    header: "الحساب",
    data: [
      _SettingTileData(
        title: "المعلومات الشخصية",
        subTitle: "الاسم، تاريخ الميلاد، الجنس ... إلخ",
        iconData: AppIcons.profileCircle,
        onTap: () => _openDetails(
          context,
          type: SettingDetailType.personalInfo,
          profile: profile,
        ),
      ),
      _SettingTileData(
        title: "عناصر التحكم",
        iconData: AppIcons.control,
        onTap: () =>
            _openDetails(context, type: SettingDetailType.systemControl),
      ),
      _SettingTileData(
        title: "الحسابات المحظورة",
        iconData: AppIcons.block,
        customTrailing: AppIconText(
          reverse: true,
          text: "15",
          icon: AppIcons.arrowForward,
          iconSize: UISizes.sp18,
        ),
        onTap: () =>
            _openDetails(context, type: SettingDetailType.blockedUsers),
      ),
    ],
  );

  // ───────────────────────── App Settings ─────────────────────────

  _SettingsSection _appSettingsSection(BuildContext context) {
    final notificationCubit = context.read<NotificationCubit>();
    final localCubit = context.read<LocalCubit>();
    return _SettingsSection(
      header: "الإعدادات",
      data: [
        _SettingTileData(
          title: "الإشعارات",
          iconData: AppIcons.notification,
          customTrailing: BaseBlocConsumer(
            bloc: notificationCubit,
            builder: (_) => AppSwitch(
              value: notificationCubit.value,
              onChanged: notificationCubit.edit,
            ),
          ),
        ),
        _SettingTileData(
          title: "السمة",
          subTitle: "تخصيص الدردشة وسمة التطبيق",
          iconData: AppIcons.paintBrush,
          onTap: () => _openDetails(context, type: SettingDetailType.theme),
        ),
        _SettingTileData(
          title: "لغة التطبيق",
          iconData: AppIcons.translate,
          customTrailing: BaseBlocConsumer(
            bloc: localCubit,
            builder: (_) => AppIconText(
              reverse: true,
              text: localCubit.value.title,
              icon: AppIcons.arrowForward,
              iconSize: UISizes.sp18,
            ),
          ),
          onTap: () => _openDetails(context, type: SettingDetailType.language),
        ),
      ],
    );
  }

  // ───────────────────────── About ─────────────────────────

  _SettingsSection _aboutSection() => _SettingsSection(
    header: "حول التطبيق",
    data: [
      _SettingTileData(title: "عن التطبيق", iconData: AppIcons.info),
      _SettingTileData(
        title: "سياسة الخصوصية",
        iconData: AppIcons.privacyPolicy,
      ),
    ],
  );

  _SettingsSection _supportSection() => _SettingsSection(
    header: "الدعم والمساعدة",
    data: [_SettingTileData(title: "تحدث معنا", iconData: AppIcons.support)],
  );

  Widget _version(BuildContext context) => AppText(
    "نسخة 1.0.0",
    style: context.textTheme.bodyMedium,
    color: context.colors.surfaceContainer,
  );
}
