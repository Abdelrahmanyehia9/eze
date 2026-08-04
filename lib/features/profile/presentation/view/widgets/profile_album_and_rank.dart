part of '../profile_screen.dart';

class _ProfileAlbumAndRank extends StatelessWidget {
  const _ProfileAlbumAndRank();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: UISizes.sp12,
      children: [
        Expanded(
          child: _item(
            title: "الرتية الحالية",
            subtitle: "جولد",
            description: "استكشف مميزات ومتطلبات كل رتبة.",
            icon: AppIcons.champion,
            iconColor: AppColors.gold,
          ),
        ),
        Expanded(
          child: _item(
            title: "معرض الصور",
            description: "اضغط لرؤية المعرض الخاص بك",
            icon: AppIcons.gallery,
            onTap: () => context.pushNamed(Routes.profileGallery),
          ),
        ),
      ],
    );
  }

  Widget _item({
    required IconData icon,
    required String title,
    String? subtitle,
    String? description,
    Color? iconColor,
    GestureTapCallback? onTap,
  }) => Builder(
    builder: (context) {
      return AppClick(
        onTap: onTap,
        child: AppCard(
          height: UISizes.sp128,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title, style: context.textTheme.labelMedium),
                      if (subtitle != null)
                        AppText(subtitle, style: context.textTheme.bodyMedium),
                    ],
                  ),
                  AppIconButton(
                    color: iconColor,
                    icon: icon,
                    radius: UISizes.r12,
                    size: UISizes.sp20,
                    backgroundColor: iconColor?.veryLight,
                  ),
                ],
              ),
              AppText(
                description,
                style: context.textTheme.bodyMedium,
                color: context.colors.surfaceContainer,
              ),
            ],
          ),
        ),
      );
    },
  );
}
