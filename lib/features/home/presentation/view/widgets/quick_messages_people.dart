part of "../home_screen.dart";

class _QuickMessagesPeople extends StatelessWidget {
  const _QuickMessagesPeople();

  @override
  Widget build(BuildContext context) {
    return  BaseBlocConsumer<BoostedUsersCubit, List<ConversationPeerEntity>>(
      successBuilder: _builder,
      loadingBuilder: ()  => _builder(ConversationPeerEntity.fake.fakeList(5))
    );

  }

  Widget _builder(List<ConversationPeerEntity> users)=>Column(
    children: [
      const SectionHeader(title: "وصول سريع"),
      UsersCircleAvatarList(size: UISizes.sp96, users: users,),
    ],
  );
}
