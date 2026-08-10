part of '../home_screen.dart';

class _HomeUnreadMessages extends StatelessWidget {
  const _HomeUnreadMessages();

  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<UnreadConversationCubit, List<ConversationEntity>>(
      successBuilder: _builder,
      loadingBuilder: () => _builder(ConversationEntity.fake.fakeList()),
    );
  }

  Widget _builder(List<ConversationEntity> conversations) => Column(
    children: [
      const SectionHeader(title: "رسائل غير مقروءة", action: "الكل"),
      ConversationList(conversations: conversations),
    ],
  );
}
