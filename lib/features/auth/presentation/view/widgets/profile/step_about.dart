part of "../../complete_profile_screen.dart";

class _StepAbout extends StatelessWidget {
  const _StepAbout();

  @override
  Widget build(BuildContext context) {
    return const _CompleteProfileScreenLayout(
      title: "خلى الناس تعرفك اكتر !",
      subtitle: "عرّف الآخرين بك بشكل أفضل من خلال اسم مستخدم مميز ونبذة قصيرة عنك.",
      fields: [
        UsernameField(),
        BioField()
      ],
    );
  }
}
