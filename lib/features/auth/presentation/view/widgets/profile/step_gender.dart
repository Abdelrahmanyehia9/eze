part of "../../complete_profile_screen.dart";

class _StepGender extends StatelessWidget {
  const _StepGender();

  @override
  Widget build(BuildContext context) {
    final genders = Gender.values;
    return _CompleteProfileScreenLayout(
      title: "ما هو جنسك",
      fields: [
        Wrap(
          spacing: UISizes.sp8,
          runSpacing: UISizes.sp8,
          children: List.generate(genders.length, (i) => _item(genders[i])),
        ),
      ],
    );
  }

  Widget _item(Gender gender) => Builder(
    builder: (context) => AppChip(
      color: Colors.transparent,
      minWidth: UISizes.sp96,
      minHeight: UISizes.sp72,
      borderColor: gender.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(gender.icon, color: gender.color, size: UISizes.sp32),
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
