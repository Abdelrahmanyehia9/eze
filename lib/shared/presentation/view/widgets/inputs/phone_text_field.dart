import 'package:country_picker/country_picker.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/app_text_field.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/app_validation.dart';
import 'package:eze/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends StatelessWidget {
  final Country country;
  final TextEditingController controller;
  const PhoneTextField({
    super.key,
    required this.controller,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader.smallHeader("رقم الهاتف", context: context),
        Directionality(
          textDirection: TextDirection.ltr,
          child: AppTextField(
            filled: false,
            controller: controller,
            validator: (phone) =>
                AppValidation.validateNumber(phone, country.example.length),
            formatter: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.phone,
            padding: EdgeInsets.zero,
            style: TextStyles.bodySmall,
            prefix: AppText(
              "+${country.phoneCode}",
              style: TextStyles.labelSmall,
              color: context.colors.surfaceContainer,
            ).appPaddingAll(12),
            hintText: country.example,
          ),
        ),
      ],
    );
  }
}
