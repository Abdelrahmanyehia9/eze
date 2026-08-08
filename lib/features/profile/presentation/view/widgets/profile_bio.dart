part of '../profile_screen.dart';

class _ProfileBio extends StatelessWidget {
  final String bio ;
  const _ProfileBio(this.bio);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          SectionHeader.smallHeader("نبذة عنى", context: context),
          AppReadMore(
            maxLines: 2,
            text:bio,
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
