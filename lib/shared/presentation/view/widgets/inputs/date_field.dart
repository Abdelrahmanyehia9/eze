import 'package:eze/core/components/app_text_field.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  final bool showHeader ;
  const DateField({super.key, this.showHeader = true});

  @override
  Widget build(BuildContext context) {
    return      AppTextField(
      borderColor: Colors.transparent,
      headerText: showHeader? "تاريخ الميلاد" : null,
      hintText:  "ادخل تاريخ الميلاد",
      readOnly: true, 
      suffix: const Icon(AppIcons.calender),

    );
  }
}
