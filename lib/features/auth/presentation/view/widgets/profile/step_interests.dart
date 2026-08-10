part of "../../complete_profile_screen.dart";

class _StepInterests extends StatelessWidget {
  const _StepInterests();

  @override
  Widget build(BuildContext context) {
    final allInterests = ProfileInterests.popular;
    return _CompleteProfileScreenLayout(
      title: "اهتماماتك",
      subtitle:
          "شاركنا اهتماماتك والأشياء التي تحبها لتعبّر عن نفسك بشكل أفضل.",
      fields: [
        const SearchField(),
        16.spaceVr,
        ProfileInterestsWrap(
          interests: allInterests,
          selected: const [
            ProfileInterests.cooking,
            ProfileInterests.programming,
          ],
        ),
        8.spaceVr,
        if (4 > 3) const ErrorChip(text: "لا يمكن اضافة اكثر من 5 اهتمامات"),
      ],
    );
  }
}
