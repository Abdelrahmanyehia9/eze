import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/settings/presentation/view/layout/blocked_users_list.dart';
import 'package:eze/features/settings/presentation/view/widgets/setting_system_control.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_local.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_profile.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_theme.dart';
import 'package:flutter/material.dart';

enum SettingDetailType {
  personalInfo(title: "الملف الشخصي"),
  systemControl(
    title: "عناصر التحكم",
    info:
        "تحكّم في الميزات الحصرية للتطبيق لتخصيص تجربتك والاستفادة من الإمكانيات التي تناسب أسلوب استخدامك.",
  ),
  blockedUsers(
    title: "الحسابات المحظورة",
    info: "الحسابات التي منعت تواصلها معك، ويمكنك إلغاء الحظر عنها متى شئت.",
  ),
  theme(
    title: "السمة",
    info:
        "تحكم في مظهر التطبيق بالكامل، بما في ذلك السمة، وألوان الدردشات، والخطوط، وغيرها من خيارات التخصيص، لتصميم تجربة تناسب ذوقك.",
  ),
  language(
    title: "اللغة",
    info:
        "غيّر لغة واجهة التطبيق واختر اللغة التي تناسبك لتجربة استخدام أكثر راحة وسهولة.",
  );

  const SettingDetailType({required this.title, this.info});

  final String title;
  final String? info;

  Widget buildBody({ProfileEntity? profile}) {
    switch (this) {
      case SettingDetailType.personalInfo:
        assert(
          profile != null,
          'profile is required for SettingDetailType.personalInfo',
        );
        return SettingsProfile(profile: profile!);
      case SettingDetailType.systemControl:
        return const SettingSystemControl();
      case SettingDetailType.blockedUsers:
        return const BlockedUsersList();
      case SettingDetailType.theme:
        return const SettingsTheme();
      case SettingDetailType.language:
        return const SettingsLocal();
    }
  }
}
