import 'package:eze/core/components/app_button.dart';
import 'package:eze/core/components/app_checkbox.dart';
import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/enums/gender.dart';
import 'package:eze/core/enums/message_alert_type.dart';
import 'package:eze/core/enums/profile_interests.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/variables.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/features/profile/presentation/view/layout/profile_interests_wrap.dart';
import 'package:eze/shared/data/models/result_screen_args.dart';
import 'package:eze/shared/presentation/view/overlays/edit_overlay.dart';
import 'package:eze/shared/presentation/view/widgets/add_media_container.dart';
import 'package:eze/shared/presentation/view/widgets/buttons/default_button.dart';
import 'package:eze/shared/presentation/view/widgets/chips.dart';
import 'package:eze/shared/presentation/view/widgets/cover_profile.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/bio_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/date_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/search_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/username_field.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/country_selector.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';
part 'layout/complete_profile_screen_layout.dart';
part 'widgets/profile/step_country.dart';
part 'widgets/profile/step_about.dart';
part 'widgets/profile/step_birthdate.dart';
part 'widgets/profile/step_gender.dart';
part 'widgets/profile/step_interests.dart';
part 'widgets/profile/step_pictures.dart';
part 'widgets/profile/step_gallery.dart';
part 'mixin/complete_profile_mixin.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen>
    with _CompleteProfileMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) {
        return PopScope(
          canPop: _isFirstStep,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            _goPrev();
          },
          child: AppScaffold(
            hPadding: 0,
            appBar: DefaultAppBar(
              actions: [
                if (value > 1 &&value!=_steps.length-1) AppButton.text("تخطي", onTap: _onFinish),
              ],
              leading: AppBackButton(
                onTap: !_isFirstStep ? _goPrev : null,
              ).appPaddingVr(4).appPaddingHr(12),
              title: "${value + 1} / ${_steps.length}",
              centerTitle: true,
            ),
            body: Column(
              spacing: UISizes.h8,
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: _steps.length,
                    onPageChanged: (i) => currentPage.value = i,
                    itemBuilder: (_, i) => _steps[i],
                  ),
                ),
                DefaultButton(
                  text: _isLastStep ? "إنهاء" : "التالى",
                  onTap: _goNext,
                ).paddingHr,
              ],
            ),
          ),
        );
      },
    );
  }
}
