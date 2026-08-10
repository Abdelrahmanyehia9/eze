part of '../settings_screen.dart';

class _SettingsProfileOverview extends StatelessWidget {
  const _SettingsProfileOverview();

  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<ProfileCubit, ProfileEntity>(
      successBuilder: _builder,
      loadingBuilder: () => _builder(ProfileEntity.fake()),
    );
  }

  Widget _builder(ProfileEntity entity) => Builder(
    builder: (context) => Column(
      children: [
        SectionHeader.smallHeader("الملف الشخصي", context: context),
        AppChip(
          paddingVr: 8,
          onTap: context.pop,
          color: context.colors.primary,
          paddingHr: UISizes.w16,
          child: IgnorePointer(
            child: Row(
              spacing: UISizes.w8,
              children: [
                UserCircleAvatar(
                  username: entity.username,
                  image: entity.image,
                  size: UISizes.sp64,
                  color: context.colors.primary,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        entity.username,
                        color: AppColors.white,
                        style: context.textTheme.labelMedium,
                      ),
                      AppText(
                        entity.loginProviderStr,
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
        ),
      ],
    ),
  );
}
