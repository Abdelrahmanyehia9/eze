part of "../../complete_profile_screen.dart";

class _StepPictures extends StatelessWidget {
  const _StepPictures();

  @override
  Widget build(BuildContext context) {
    return _CompleteProfileScreenLayout(
      subtitle: "أضف صورك المفضلة واجعل ملفك الشخصي يعكس شخصيتك.",
      fields: [
        SectionHeader.smallHeader("الصورة الشخصية", context: context),
        Center(
          child: EditOverlay(
            child: UserCircleAvatar(
              size: UISizes.sp128,
              username: FakeData.string(),
            ),
            onEdit: () {},
          ),
        ),
        Gap.medium(),
        SectionHeader.smallHeader("الغلاف", context: context),
        EditOverlay(
          margin: EdgeInsets.all(UISizes.sp12),
          child: CoverProfile(null, height: UISizes.h128),
        ),
      ],
    );
  }
}
