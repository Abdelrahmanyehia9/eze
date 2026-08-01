import 'package:eze/core/components/app_switch.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/enums/chat_features.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:eze/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eze/shared/presentation/view/layout/conversation_list.dart';
import 'package:eze/shared/presentation/view/widgets/buttons/default_button.dart';
part 'widgets/home_complete_profile_banner.dart';
part 'widgets/home_unread_messages.dart';
part 'widgets/home_featured_groups.dart';
part 'widgets/home_chat_features.dart';
part 'layout/chat_features_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: UISizes.sp16,
        children: [
          const _HomeCompleteProfileBanner(),
          const _HomeChatFeatures().paddingHr,
          const _HomeUnreadMessages().paddingHr,
          const _HomeFeaturedGroup().paddingHr,
        ],
      ),
    );
  }
}
