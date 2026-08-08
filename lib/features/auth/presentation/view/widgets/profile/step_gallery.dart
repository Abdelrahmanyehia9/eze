part of "../../complete_profile_screen.dart";

class _StepGallery extends StatelessWidget {
  const _StepGallery();

  @override
  Widget build(BuildContext context) {
    return _CompleteProfileScreenLayout(
      title: "معرض الصور",
      subtitle: "أضف صورك المفضلة وشارك لحظاتك مع الآخرين.",
      fields: [
        GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: UISizes.sp8,
            crossAxisSpacing: UISizes.sp8
          ),
          itemBuilder: (_,i)=>AddMediaContainer(
            filled: false,
            borderRadius: BorderRadiusGeometry.circular(UISizes.r12),
          ),
        ),
      ],
    );
  }
}
