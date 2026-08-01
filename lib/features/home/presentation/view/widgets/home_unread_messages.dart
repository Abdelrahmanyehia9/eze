part of '../home_screen.dart';

class _HomeUnreadMessages extends StatelessWidget {
  const _HomeUnreadMessages();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.h8,
      children: const [
        SectionHeader(title: "رسائل غير مقروءة", action: "الكل"),
        ConversationList(),
      ],
    );
  }
}
