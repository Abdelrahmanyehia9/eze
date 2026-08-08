part of "../../complete_profile_screen.dart";


class _StepBirthdate extends StatelessWidget {
  const _StepBirthdate();

  @override
  Widget build(BuildContext context) {
    return const _CompleteProfileScreenLayout(
      subtitle: "باقي خطوة بسيطة، أضف تاريخ ميلادك لإكمال ملفك الشخصي.",
        fields: [
          DateField(
            showHeader: false,
          )
        ]
    );
  }
}
