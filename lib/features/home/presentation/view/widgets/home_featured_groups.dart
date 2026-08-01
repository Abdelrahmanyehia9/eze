part of '../home_screen.dart';

class _HomeFeaturedGroup extends StatelessWidget {
  const _HomeFeaturedGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.h8,
      children: const [
        SectionHeader(title: "ابرز المجموعات", action: "الكل"),
        ConversationList(count: 4),
      ],
    );
  }
}
