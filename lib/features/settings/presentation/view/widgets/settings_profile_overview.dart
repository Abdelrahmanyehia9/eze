part of '../settings_screen.dart';

class _SettingsProfileOverview extends StatelessWidget {
  const _SettingsProfileOverview();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader.smallHeader("الملف الشخصي", context: context),
        AppChip(
          paddingVr: 8,
          onTap: context.pop,
          color: context.colors.primary,
          paddingHr: UISizes.w16,
          child: Row(
            spacing: UISizes.w8,
            children: [
              UserCircleAvatar(username: FakeData.string(), size: UISizes.sp64 , color: context.colors.primary,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "مريم خالد",
                      color: AppColors.white,
                      style: context.textTheme.labelMedium,
                    ),
                    AppText(
                      "Mariem@gmail.com",
                      color: AppColors.white,
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Icon(
                AppIcons.arrowForward,
                size: UISizes.sp20,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
