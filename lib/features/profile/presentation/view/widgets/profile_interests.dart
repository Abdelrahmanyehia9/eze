part of '../profile_screen.dart';

class _ProfileInterests extends StatelessWidget {
  const _ProfileInterests();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.sp4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader.smallHeader("الهوايات ", context: context),
        Wrap(
          spacing: UISizes.w4,
          runSpacing: UISizes.w4,
          children: List.generate(8, (i) => const AppChip(title: "القراءة")),
        ),
      ],
    );
  }
}
