part of '../home_screen.dart';

class _HomeChatFeatures extends StatelessWidget {
  final bool showTitle;
  const _HomeChatFeatures({this.showTitle = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showTitle) const SectionHeader(title: "عناصر التحكم"),
        const _ChatFeaturesGrid(),
      ],
    );
  }
}
