part of "../home_screen.dart";

class _QuickMessagesPeople extends StatelessWidget {
  const _QuickMessagesPeople();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.h8,
      children: [
        const SectionHeader(title: "وصول سريع"),
        UsersCircleAvatarList(size: UISizes.sp96),
      ],
    );
  }
}
