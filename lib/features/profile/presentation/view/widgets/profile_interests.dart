part of '../profile_screen.dart';

class _ProfileInterests extends StatelessWidget {
  const _ProfileInterests();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader.smallHeader("الهوايات ", context: context),
        const ProfileInterestsWrap()
      ],
    );
  }
}
