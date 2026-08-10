part of '../profile_screen.dart';

class _ProfileInterests extends StatelessWidget {
  final List<ProfileInterests>? interests;
  const _ProfileInterests(this.interests);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader.smallHeader("الهوايات ", context: context),
        ProfileInterestsWrap(interests: interests),
      ],
    );
  }
}
