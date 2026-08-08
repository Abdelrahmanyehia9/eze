import 'package:country_picker/country_picker.dart';
import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/enums/gender.dart';
import 'package:eze/core/enums/profile_interests.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/presentation/view/layout/profile_interests_wrap.dart';
import 'package:eze/shared/presentation/view/widgets/buttons/default_button.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/gender_selector.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/bio_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/date_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/email_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/username_field.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/country_selector.dart';
import 'package:flutter/material.dart';

part  "settings_profile_interests.dart" ;
part '../mixin/settings_profile_mixin.dart';

class SettingsProfile extends StatefulWidget {
  final ProfileEntity profile ;
  const SettingsProfile({super.key, required this.profile});

  @override
  State<SettingsProfile> createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile>  with _SettingsProfileMixin{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: UISizes.h8,
      children: [
         UsernameField(
           controller: _usernameController,
         ),
         EmailField(
           controller:  _emailController,
         ),
         DateField(
           initialDate: _birthDate,
         ),
        CountrySelector(country:_country, enabled: false, header: "البلد",),
         BioField(
           controller: _bioController,
         ),
         if(_interests.isNotEmpty)
         _SettingsProfileInterests(
           interests: _interests,
         ),
         GenderSelector(
           initialGender: _gender,
         ),
        const DefaultButton(text: "تاكيد").paddingVr
      ],
    );
  }
}


