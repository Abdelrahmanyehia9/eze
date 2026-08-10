part of "../complete_profile_screen.dart";

class _CompleteProfileScreenLayout extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final List<Widget> fields;
  const _CompleteProfileScreenLayout({
    this.title,
    required this.fields,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildHeader(), 24.spaceVr, ...fields],
    ).paddingHr;
  }

  Widget _buildHeader() => Builder(
    builder: (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title ?? "اكمل الملف الشخصي",
          style: context.textTheme.labelLarge,
        ),
        if (!subtitle.isNullOrEmpty)
          AppText(
            subtitle,
            style: context.textTheme.bodyMedium,
            color: context.colors.surfaceContainer,
          ),
      ],
    ),
  );
}
