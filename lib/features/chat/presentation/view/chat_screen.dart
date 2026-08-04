import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_menu_anchor.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/app_text_field.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/extensions/chat_theme.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_assets.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/chat/presentation/view/layout/chat_list.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

part 'widgets/chat_appbar.dart';
part 'widgets/chat_input_bar.dart';
part 'widgets/chat_background_container.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomPadding: false,
      hPadding: 0,
      topPadding: false,
      appBar: const _ChatAppbar(),
      body: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          const _ChatBackgroundContainer(),
          Column(
            children: [
              const Expanded(child: ChatList()),
              Padding(
                padding: EdgeInsets.only(bottom: context.safeBottomArea),
                child: const _ChatInputBar(),
              ),
            ],
          ).paddingHr,
        ],
      ),
    );
  }
}
