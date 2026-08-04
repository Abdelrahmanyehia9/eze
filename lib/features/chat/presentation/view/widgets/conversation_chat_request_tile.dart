part of "../conversations_screen.dart";

class ConversationChatRequestTile extends StatelessWidget {
  const ConversationChatRequestTile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
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
                  "استعرض طلبات المراسلة الواردة وقم بقبولها أو تجاهلها.",
                  style: context.textTheme.bodySmall,
                  fontSize: UISizes.sp12,
                  color: context.colors.surfaceContainer,
                ),
              ],
            ),
          ),
          Badge(
            backgroundColor: context.colors.primary,
            label: const AppText("2"),
          ),
        ],
      ),
    );
  }
}
