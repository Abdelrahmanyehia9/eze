part of '../home_screen.dart';

class _HomeChatFeatures extends StatelessWidget {
  const _HomeChatFeatures();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: "عناصر التحكم"),
        const _ChatFeaturesGrid(),
      ],
    );
  }
}
