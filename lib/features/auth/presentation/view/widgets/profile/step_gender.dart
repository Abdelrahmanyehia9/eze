part of "../../complete_profile_screen.dart";

class _StepGender extends StatelessWidget {
  const _StepGender();

  @override
  Widget build(BuildContext context) {
    final genders = Gender.values;
    return _CompleteProfileScreenLayout(
      title: "ما هو جنسك",
      fields: [
        Expanded(
          child: GridView.builder(
            itemCount: genders.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: UISizes.sp8 ,
              mainAxisSpacing: UISizes.sp8
            ),
            itemBuilder: (_, i) => _item(genders[i]),
          ),
        ),
      ],
    );
  }

  Widget _item(Gender gender) => Builder(
    builder: (context) => AppCard(
      color: gender.color.veryLight,
      shadow: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(gender.icon, color: gender.color, size: UISizes.sp40),
          AppText(
            gender.text,
            color: gender.color,
            style: context.textTheme.labelLarge,
          ),
        ],
      ),
    ),
  );
}
