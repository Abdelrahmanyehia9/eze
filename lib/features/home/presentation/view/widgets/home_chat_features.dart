part of '../home_screen.dart';

class _HomeChatFeatures extends StatefulWidget {
  const _HomeChatFeatures();

  @override
  State<_HomeChatFeatures> createState() => _HomeChatFeaturesState();
}

class _HomeChatFeaturesState extends State<_HomeChatFeatures> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.h8,
      children: const [
        SectionHeader(title: "عناصر التحكم"),
        _ChatFeaturesGrid(),
      ],
    );
  }
}
