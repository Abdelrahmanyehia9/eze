import 'package:country_picker/country_picker.dart';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/theme/app_decorations.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class CountrySelector extends StatelessWidget {
  final Country country ;
  final ValueChanged<Country> onChanged ;
  const CountrySelector({super.key,required this.country , required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: UISizes.h4,
      children: [
        SectionHeader.smallHeader("اختر الدولة", context: context),
        AppClick(
          onTap: () => showCountryPicker(
              countryListTheme: _theme(context),
              context: context, onSelect: onChanged) ,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: UISizes.w16, vertical: UISizes.h16),
            decoration: BoxDecoration(
              boxShadow: AppDecorations.cardShadow,
                color: context.colors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(UISizes.r12)
            ),
            child: Row(
              spacing: UISizes.sp8,
              children: [
                AppText(country.flagEmoji),
                AppText(country.displayNameNoCountryCode),
                Spacer(),
                Icon(AppIcons.arrowForward)
              ],
            ),
          ),
        ),
      ],
    );



  }

  CountryListThemeData  _theme(BuildContext context) => CountryListThemeData(
    inputDecoration: InputDecoration(
        labelText: "البحث",
        labelStyle: context.textTheme.bodySmall,
        border: context.inputDecorationTheme.border,
        enabledBorder: context.inputDecorationTheme.enabledBorder,
        focusColor: context.inputDecorationTheme.focusColor,
        filled: true,
        fillColor: context.colors.surfaceContainerLowest
    ),
    backgroundColor : context.scaffoldBackgroundColor,
    textStyle : context.textTheme.labelSmall,
    searchTextStyle : context.textTheme.bodySmall,
    flagSize : UISizes.sp20,
  );
}
