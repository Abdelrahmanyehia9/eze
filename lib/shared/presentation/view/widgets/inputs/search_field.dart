import 'package:eze/core/components/app_text_field.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      height: UISizes.h40,
      padding: EdgeInsets.zero,
      prefix: Icon(AppIcons.search, size: UISizes.sp20),
      labelText: "البحث ",
    );
  }
}
