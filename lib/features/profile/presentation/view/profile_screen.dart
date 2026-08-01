import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_cached_network_image.dart';
import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_logo.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/app_text_read_more.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/shared/presentation/view/overlays/edit_overlay.dart';
import 'package:eze/shared/presentation/view/widgets/circle_progress_with_value.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';
part 'widgets/profile_edit_pic.dart';
part 'widgets/profile_album_and_rank.dart';
part 'widgets/profile_name_and_email.dart';
part 'widgets/complete_profile_progress_tile.dart';
part 'widgets/profile_bio.dart';
part 'widgets/profile_interests.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      extendBodyBehindAppBar: true,
      topPadding: false,
      hPadding: 0,
      appBar: const DefaultAppBar(
        centerTitle: true,
        actions: [
          AppIconButton(
            backgroundColor: Colors.transparent,
            icon: AppIcons.settings,
          ),
        ],
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
        title: "الملف الشخصى",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeading(),
            Gap.large(),
            _buildBody(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeading() => Column(
    spacing: UISizes.h4,
    children: const [_ProfileEditPic(), _ProfileNameAndEmail()],
  );

  Widget _buildBody() => Column(
    spacing: UISizes.h16,
    children: const [
      _CompleteProfileProgressTile(),
      _ProfileBio(),
      _ProfileInterests(),
      _ProfileAlbumAndRank(),
    ],
  ).paddingHr;

  Widget _buildFooter() => Builder(
    builder: (context) {
      return AppButton.filled(
        "تسجيل الخروح",
        backgroundColor: context.colors.error,
      ).paddingAll;
    },
  );
}
