import 'package:eze/core/components/app_dropdown.dart';
import 'package:eze/core/components/app_icon_text.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/enums/gender.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final bool showHeader ;
  const GenderSelector({super.key, this.showHeader =true});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.h4,
      children: [
        if(showHeader)
        SectionHeader.smallHeader("الجنس", context: context),
        AppDropdown<Gender>(
          items: Gender.values,
          value: Gender.male,
          borderColor: Colors.transparent,
          padding: EdgeInsets.zero,
          onChange: (_){},
          itemBuilder: (g)=>AppIconText(
            text: g.text,
            icon: g.icon,
          ),
        ),
      ],
    );
  }

}
