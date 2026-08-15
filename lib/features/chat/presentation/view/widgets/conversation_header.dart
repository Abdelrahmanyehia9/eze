part of "../conversations_screen.dart";

class _ConversationHeader extends StatefulWidget
    implements PreferredSizeWidget {
  const _ConversationHeader();

  @override
  State<_ConversationHeader> createState() => _ConversationHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(UISizes.h48);
}

class _ConversationHeaderState extends State<_ConversationHeader>
    with PinMixin<ConversationEntity>, MarkReadMixin<ConversationEntity> {
  AllConversationsCubit get convCubit => context.read<AllConversationsCubit>();

  @override
  Widget build(BuildContext context) {
    return SelectionBuilder<ConversationEntity>(
      builder: (cubit, state) => DefaultAppBar.logo(
        title: "المحادثات",
        actions: [
          if (state.count > 0)
            Badge(
              padding: EdgeInsets.all(UISizes.sp2),
              backgroundColor: context.appBarTheme.foregroundColor?.veryLight,
              label: AppText(
                state.selected.length.toString(),
                style: context.textTheme.titleMedium,
                color: context.appBarTheme.foregroundColor,
              ),
            ),
          AppMenuAnchor(
            items: state.isSelectionMode
                ? _selectionModeItems(cubit, state)
                : _defaultModeItems(cubit, state),
          ),
        ],
      ),
    );
  }

  List<AppMenuData> _defaultModeItems(
    SelectionCubit<ConversationEntity> cubit,
    SelectionState<ConversationEntity> state,
  ) => [
    AppMenuData(title: "تحديد الكل", onTap: cubit.selectAll),
    AppMenuData(
      title: "اعدادات النظام",
      onTap: () => context.pushNamed(
        Routes.settingDetails,
        arguments: const SettingDetailsScreenArgs(
          type: SettingDetailType.systemControl,
        ),
      ),
    ),
  ];

  List<AppMenuData> _selectionModeItems(
    SelectionCubit<ConversationEntity> cubit,
    SelectionState<ConversationEntity> state,
  ) => [
    AppMenuData(title: "إلغاء التحديد", onTap: cubit.unselectAll),
    AppMenuData(
      title: hasUnread(state.selected) ? "تحديد كمقروء" : "تحديد كغير مقروء",
    ),
    const AppMenuData(title: "نقل", leadingIcon: AppIcons.move),
    if (isAllPinned(state.selected))
      AppMenuData(
        title: "إلغاء التثبيت",
        leadingIcon: AppIcons.pin,
        onTap: () {
          cubit.unselectAll();
          onUnpin(state.selected.toList());
        },
      )
    else if (canPin(selected: state.selected, all: cubit.all))
      AppMenuData(
        title: "تثبيت",
        leadingIcon: AppIcons.pin,
        onTap: () {
          cubit.unselectAll();
          onPin(state.selected.toList());
        },
      ),
    const AppMenuData(title: "حذف", leadingIcon: AppIcons.delete),
  ];

  @override
  bool isPinned(ConversationEntity item) => item.pinned;

  @override
  MessageStatus status(ConversationEntity item) => item.messageStatus.status;

  @override
  Future<void> onPin(List<ConversationEntity> items) async =>
      convCubit.pinConversations(conversations: items);

  @override
  Future<void> onUnpin(List<ConversationEntity> items) async =>
      convCubit.unpinConversations(conversations: items);
}
