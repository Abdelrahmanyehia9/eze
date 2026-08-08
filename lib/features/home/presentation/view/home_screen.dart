import 'package:eze/core/components/app_switch.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/enums/chat_features.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:eze/core/utils/app_assets.dart';
import 'package:eze/features/home/presentation/controller/boosted_users_cubit.dart';
import 'package:eze/features/home/presentation/controller/popular_groups_cubit.dart';
import 'package:eze/features/home/presentation/controller/unread_conversation_cubit.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/presentation/controller/profile_cubit.dart';
import 'package:eze/features/settings/domain/entities/settings_entity.dart';
import 'package:eze/features/settings/domain/entities/system_control_entity.dart';
import 'package:eze/features/settings/presentation/controller/settings_cubit.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';
import 'package:eze/shared/presentation/view/layout/users_circle_avatar_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eze/shared/presentation/view/layout/conversation_list.dart';
import 'package:eze/shared/presentation/view/widgets/buttons/default_button.dart';

part 'widgets/home_complete_profile_banner.dart';

part 'widgets/home_unread_messages.dart';

part 'widgets/home_featured_groups.dart';

part 'widgets/home_chat_features.dart';

part 'layout/chat_features_grid.dart';

part 'widgets/quick_messages_people.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(spacing: UISizes.sp16, children: [_header(), _body()]),
    );
  }

  Widget _header() => const _HomeCompleteProfileBanner();

  Widget _body() => Builder(
    builder: (context) {
      return Column(
        spacing: UISizes.h12,
        children: const [
          _HomeChatFeatures(),
          _QuickMessagesPeople(),
          _HomeUnreadMessages(),
          _HomeFeaturedGroup(),
        ],
      ).paddingHr;
    },
  );
}
