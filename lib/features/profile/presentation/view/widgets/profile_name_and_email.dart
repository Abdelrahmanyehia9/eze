part of '../profile_screen.dart';

class _ProfileNameAndEmail extends StatelessWidget {
  final String username ;
  final String? subtitle ;
  const _ProfileNameAndEmail({required this.username, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          textAlign: TextAlign.center,
          username,
          style: context.textTheme.labelLarge,
          height: 0,
        ),
        if(subtitle!=null)
        AppText(
          textAlign: TextAlign.center,
          subtitle,
          style: context.textTheme.bodyMedium,
          color: context.colors.surfaceContainer,
          height: 0,
        ),
      ],
    );
  }
}
