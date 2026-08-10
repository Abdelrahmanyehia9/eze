part of '../home_screen.dart';

class _HomeFeaturedGroup extends StatelessWidget {
  const _HomeFeaturedGroup();

  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<PopularGroupsCubit, List<ConversationEntity>>(
      successBuilder: _builder,
      loadingBuilder: () => _builder(ConversationEntity.fake.fakeList()),
    );
  }

  Widget _builder(List<ConversationEntity> conversations) => Column(
    children: [
      const SectionHeader(title: "ابرز المجموعات", action: "الكل"),
      ConversationList(conversations: conversations),
    ],
  );
}
