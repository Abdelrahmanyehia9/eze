part of "../conversations_screen.dart";

class ConversationChatRequestTile extends StatelessWidget {
  const ConversationChatRequestTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<ConversationRequestsCubit, List<ConversationEntity>>(
      successBuilder: _builder,
      loadingBuilder: ()=>_builder(ConversationEntity.fake.fakeList()),
    );
  }
  Widget _builder(List<ConversationEntity> conversations)=> Builder(
    builder: (context) {
      final users = conversations.map((e)=>e.peer.name).toList().join(" , ") ;
      return AppClick(
        onTap: ()=>context.pushNamed(Routes.chatRequests, arguments: conversations),
        child: AppCard(
          child: Row(
            spacing: UISizes.w8,
            children: [
              Container(
                width: UISizes.sp48,
                height: UISizes.sp48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(UISizes.r16),
                  color: context.colors.primary,
                ),
                child: Icon(
                  AppIcons.personPlus,
                  size: UISizes.sp24,
                  color: context.colors.onPrimary,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "طلبات المراسلة",
                      height: 0,
                      style: context.textTheme.labelSmall,
                    ),
                    AppText(
                      height: 0,
                      maxLines: 2,
                      "اضغط هنا للرد على طلبيات المراسلة من $users ",
                      style: context.textTheme.bodySmall,
                      fontSize: UISizes.sp12,
                      overflow: TextOverflow.ellipsis,
                      color: context.colors.surfaceContainer,
                    ),
                  ],
                ),
              ),
              Badge(
                backgroundColor: context.colors.primary,
                label:  AppText(conversations.length.toString()),
              ),
            ],
          ),
        ),
      );
    }
  );
}
