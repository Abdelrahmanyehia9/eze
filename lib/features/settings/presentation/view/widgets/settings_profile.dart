import 'package:country_picker/country_picker.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/shared/presentation/view/widgets/buttons/default_button.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/gender_selector.dart';
import 'package:eze/features/settings/presentation/view/widgets/settings_profile_interests.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/bio_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/date_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/email_field.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/username_field.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/country_selector.dart';
import 'package:flutter/material.dart';

class SettingsProfile extends StatelessWidget {
  const SettingsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: UISizes.h8,
      children: [
        const UsernameField(),
        const EmailField(),
        const DateField(),
        CountrySelector(country: Country.parse("EG"), enabled: false, header: "البلد",),
        const BioField(),
        const SettingsProfileInterests(),
        const GenderSelector(),
        const DefaultButton(text: "تاكيد").paddingVr
      ],
    );
  }
}


