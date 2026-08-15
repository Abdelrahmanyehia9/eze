part of '../chat_screen.dart';

class _ChatInputBar extends StatefulWidget {
  final ChatStyle style;

  const _ChatInputBar({required this.style});

  @override
  State<_ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<_ChatInputBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppChip(
      radius: UISizes.r20,
      color: context.colors.surface,
      paddingVr: 8,
      paddingHr: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RepliedOnBubble(style: widget.style),
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  controller: _controller,
                  hintText: "اكتب رسالتك هنا ..",
                  maxLines: 6,
                  minLines: 1,
                  padding: EdgeInsets.symmetric(horizontal: UISizes.w8),
                  filled: false,
                  border: InputBorder.none,
                ),
              ),
              _buildAttachmentIcon(),
              _buildSendIcon(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSendIcon() => Builder(
    builder: (context) {
      return Container(
        height: UISizes.sp48,
        width: UISizes.sp48,
        decoration: BoxDecoration(
          color: widget.style.appBarBackgroundColor,
          borderRadius: BorderRadius.circular(UISizes.r20),
        ),
        child: Icon(
          AppIcons.send,
          color: widget.style.incomingTextColor,
          size: UISizes.sp24,
        ),
      );
    },
  );
  Widget _buildAttachmentIcon() => AppIconButton(
    backgroundColor: Colors.transparent,
    size: UISizes.sp24,
    icon: AppIcons.attach,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _RepliedOnBubble extends StatelessWidget {
  final ChatStyle style;
  const _RepliedOnBubble({required this.style});

  @override
  Widget build(BuildContext context) {
    final sendMessageCubit = context.read<SendMessageCubit>();
    return ValueListenableBuilder(
      valueListenable: sendMessageCubit.repliedMessage,
      builder: (context, value, child) {
        return AnimatedSize(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          alignment: Alignment.bottomCenter,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            transitionBuilder: (child, animation) {
              return ClipRect(
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                      ),
                  child: FadeTransition(opacity: animation, child: child),
                ),
              );
            },
            child: value == null
                ? const SizedBox.shrink(key: ValueKey('empty'))
                : Stack(
                    key: const ValueKey('reply'),
                    alignment: AlignmentGeometry.topEnd,
                    children: [
                      BubbleReplyPreview(
                        bubbleStyle: style
                            .copyWith(
                              replyBackgroundColor: Colors.transparent,
                              outgoingTextColor:
                                  context.colors.surfaceContainerHigh,
                            )
                            .bubble(true),
                        repliedMessage: value,
                      ),
                      AppIconButton(
                        onTap: () => sendMessageCubit.addMessageReply(null),
                        icon: AppIcons.close,
                        size: UISizes.sp14,
                        backgroundColor: Colors.transparent,
                      ).appPaddingAll(4),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
