part of '../home_screen.dart';

class _HomeCompleteProfileBanner extends StatelessWidget {
  const _HomeCompleteProfileBanner();

  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<ProfileCubit, ProfileEntity>(
      successBuilder: _builder,
    );
  }

  Widget _builder(ProfileEntity profile) => Builder(
    builder: (context) {
      if (profile.isCompleted) return const SizedBox.shrink();
      return Container(
        padding: EdgeInsets.all(UISizes.sp16),
        decoration: BoxDecoration(
          color: context.colors.primary.withAppOpacity(0.05),
        ),
        child: Row(
          spacing: UISizes.w8,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "مرحبا يا ${profile.username}",
                    style: TextStyles.labelMedium,
                  ),
                  AppText(
                    style: context.textTheme.bodySmall,
                    "للحصول على تجربة استخدام افضل قم بملئ الملف الخاص بك ",
                  ),
                  Gap.small(),
                  DefaultButton(
                    radius: UISizes.r8,
                    text: "اكمال الملف ",
                    fixedSize: Size(UISizes.w128, UISizes.h32),
                  ),
                ],
              ),
            ),
            _buildIllustration(),
          ],
        ),
      );
    },
  );

  Widget _buildIllustration() => Builder(
    builder: (context) {
      return SvgPicture.asset(
        AppAssets.helloIllustration,
        width: context.width * .4,
      );
    },
  );
}
