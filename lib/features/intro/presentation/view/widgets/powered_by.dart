part of "../splash_screen.dart";

class _PoweredBy extends StatelessWidget {
  final Animation<Offset> poweredAnim;
  final Animation<Offset> nexyraAnim;

  const _PoweredBy({required this.poweredAnim, required this.nexyraAnim});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Column(
        children: [
          SlideTransition(
            position: poweredAnim,
            child: AppText(
              "مدعوم بواسطة",
              style: context.textTheme.labelMedium,
              color: context.colors.primary,
            ),
          ),
          SlideTransition(
            position: nexyraAnim,
            child: AppText(
              "نيكسيرا تيكنولوجى",
              style: context.textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
