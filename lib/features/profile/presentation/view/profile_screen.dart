import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/app_text_read_more.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/enums/profile_interests.dart';
import 'package:eze/core/enums/rank.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/variables.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/presentation/controller/profile_cubit.dart';
import 'package:eze/features/profile/presentation/view/layout/profile_interests_wrap.dart';
import 'package:eze/features/settings/data/model/settings_screen_args.dart';
import 'package:eze/shared/data/models/typed_media_model.dart';
import 'package:eze/shared/presentation/view/overlays/edit_overlay.dart';
import 'package:eze/shared/presentation/view/widgets/circle_progress_with_value.dart';
import 'package:eze/shared/presentation/view/widgets/cover_profile.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/profile_picture_and_cover.dart';

part 'widgets/profile_album_and_rank.dart';

part 'widgets/profile_name_and_email.dart';

part 'widgets/complete_profile_progress_tile.dart';

part 'widgets/profile_bio.dart';

part 'widgets/profile_interests.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      extendBodyBehindAppBar: true,
      topPadding: false,
      hPadding: 0,
      appBar: DefaultAppBar(
        centerTitle: true,
        actions: [
          if (profile.isMe)
            AppIconButton(
              backgroundColor: Colors.transparent,
              icon: AppIcons.settings,
              onTap: () => context.pushNamed(
                Routes.settings,
                arguments: SettingsScreenArgs(
                  profileCubit: context.read<ProfileCubit>(),
                ),
              ),
            ),
        ],
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
        title: profile.isMe ? "الملف الشخصى" : profile.username,
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
    children: [
      _ProfilePictureAndCover(
        profilePic: profile.image,
        cover: profile.cover,
        username: profile.username,
      ),
      _ProfileNameAndEmail(
        username: profile.username,
        subtitle: profile.loginProviderStr,
      ),
    ],
  );

  Widget _buildBody() => Column(
    spacing: UISizes.h16,
    children: [
      _CompleteProfileProgressTile(profile.progress),
      if (profile.bio != null) _ProfileBio(profile.bio!),
      _ProfileInterests(profile.interests),
      _ProfileAlbumAndRank(profile.rank, profile.gallery),
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
