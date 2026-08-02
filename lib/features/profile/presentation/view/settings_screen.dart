import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_switch.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
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
      body: SingleChildScrollView(
        child: Column(
          spacing: UISizes.h16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SettingsProfileOverview(),
            _buildAccountSection(),
            _buildAppSettingsSection(),
            _buildAboutAppSection(),
            _buildSupportSection(),
            _buildVersion()
          ],
        ),
      ),
    );
  }

  _SettingsSection _buildAccountSection() => _SettingsSection(
    header: "الحساب",
    data: [
      _SettingTileData(
        title: "المعلومات الشخصية",
        subTitle: "الاسم ,تاريخ الميلاد,الجنس ... الخ",
        iconData: AppIcons.profileCircle,
        onTap: () {},
      ),
      _SettingTileData(
        title: "عناصر التحكم",
        iconData: AppIcons.control,
      ),
      _SettingTileData(
        title: "الحسابات المحظورة ",
        iconData: AppIcons.block,
        customTrailing: AppIconText(
          reverse: true,
          text: "15",
          iconSize: UISizes.sp18,
          icon: AppIcons.arrowForward,
        )
      ),
    ],
  );
  _SettingsSection _buildAppSettingsSection() => _SettingsSection(
    header: "الاعدادات",
    data: [
      _SettingTileData(
        title: "الاشعارات ",
        iconData: AppIcons.notification,
        customTrailing: AppSwitch(value: true, onChanged: (_){})
      ),
      _SettingTileData(
        title: "السمة",
        subTitle: "تخصيص الدردشة وسمة التطبيق",
        iconData: AppIcons.paintBrush,
      ),
      _SettingTileData(
        title: "لغة التطبيق",
        iconData: AppIcons.translate,
        customTrailing: AppIconText(
          reverse: true,
          text: "العربية",
          icon: AppIcons.arrowForward,
          iconSize: UISizes.sp18,
        ),
      ),
    ],
  );
  _SettingsSection _buildAboutAppSection() => _SettingsSection(
    header: "حول التطبيق",
    data: [
      _SettingTileData(
        title: "عن التطبيق ",
        iconData: AppIcons.info,
      ),
      _SettingTileData(
        title: "سياسة الخصوصية",
        iconData: AppIcons.privacyPolicy,
      ),
    ],
  );
  _SettingsSection _buildSupportSection() => _SettingsSection(
    header: "الدعم والمساعدة",
    data: [
      _SettingTileData(
        title: "تحدث معنا",
        iconData: AppIcons.support,
      ),
    ],
  );
   Widget _buildVersion()=>Builder(
    builder: (context) {
      return AppText("نسخة 1.0.0",style: context.textTheme.bodyMedium,
        color: context.colors.surfaceContainer,

      );
    }
  ) ;
}
