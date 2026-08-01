part of '../profile_screen.dart';

class _ProfileNameAndEmail extends StatelessWidget {
  const _ProfileNameAndEmail();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          textAlign: TextAlign.center,
          "مريم خالد",
          style: context.textTheme.labelLarge,
          height: 0,
        ),
        AppText(
          textAlign: TextAlign.center,
          "Mariem12@gmail.com",
          style: context.textTheme.bodyMedium,
          color: context.colors.surfaceContainer,
          height: 0,
        ),
      ],
    );
  }
}
