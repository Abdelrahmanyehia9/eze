part of 'settings_profile.dart';

class _SettingsProfileInterests extends StatelessWidget {
  final List<ProfileInterests> interests;
  const _SettingsProfileInterests({required this.interests});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.h8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader.smallHeader(
          paddingVr: 0,
          "الهواايات",
          context: context,
          customAction: AppChip(
            monochromatic: true,
            radius: UISizes.r8,
            child: AppIconText(
              text: "تعديل",
              icon: AppIcons.edit,
              iconSize: UISizes.sp12,
              textSize: UISizes.sp14,
              color: context.colors.primary,
            ),
          ),
        ),
        ProfileInterestsWrap(interests: interests),
      ],
    );
  }
}
