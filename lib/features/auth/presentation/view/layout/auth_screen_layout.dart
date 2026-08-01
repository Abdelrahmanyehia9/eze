part of "../auth_screen.dart";

class _AuthScreenLayout extends StatelessWidget {
  final List<Widget> authButtons;

  final Widget? privacyAgree;

  const _AuthScreenLayout({this.privacyAgree, required this.authButtons});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ColoredBox(color: Colors.black, child: SizedBox.expand()),
        Image.asset(
          AppAssets.authBackground,
          width: context.width,
          fit: BoxFit.cover,
          color: AppColors.black.withAppOpacity(.6),
          colorBlendMode: BlendMode.srcATop,
        ),
        Column(
          spacing: UISizes.h12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              offset: Offset(0, UISizes.sp40),
              child: AvatarGlow(
                startRadius: UISizes.sp40,
                endRadius: UISizes.sp84,
                curve: Curves.easeInOut,
                glowOpacity: .15,
                child: const AppLogo(),
              ),
            ),
            SizedBox(
              width: context.width * .775,
              child: AppText(
                "علاقات حقيقية فقط، لا علاقات عابرة",
                color: AppColors.white,
                height: 0,
                textAlign: TextAlign.center,
                style: context.textTheme.labelLarge,
              ),
            ),
            ...authButtons,
            ?privacyAgree,
          ],
        ).paddingHr,
      ],
    );
  }
}
