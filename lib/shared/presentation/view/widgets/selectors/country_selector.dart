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
  final Country country;
  final ValueChanged<Country>? onChanged;
  final bool enabled  ;
  final String? header ;
  const CountrySelector({
    super.key,
    required this.country,
     this.onChanged,
    this.enabled = true,
    this.header
  });



  @override
  Widget build(BuildContext context) {
    final header = this.header ?? "اختر الدولة";
    return Column(
      children: [
        SectionHeader.smallHeader(header, context: context),
        AppClick(
          onTap: enabled? () => showCountryPicker(
            countryListTheme: _theme(context),
            context: context,
            onSelect:(country)=> onChanged?.call(country),
          ): null,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: UISizes.w16,
              vertical: UISizes.h16,
            ),
            decoration: BoxDecoration(
              boxShadow: AppDecorations.cardShadow,
              color: enabled? context.colors.surfaceContainerLowest : context.colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(UISizes.r12),
            ),
            child: Row(
              spacing: UISizes.sp8,
              children: [
                AppText(country.flagEmoji,
                color:!enabled ? context.colors.surfaceContainer : null,
                ),
                AppText(country.displayNameNoCountryCode,),
                const Spacer(),
                if(enabled)
                const Icon(AppIcons.arrowForward),
              ],
            ),
          ),
        ),
      ],
    );
  }

  CountryListThemeData _theme(BuildContext context) => CountryListThemeData(
    inputDecoration: InputDecoration(
      labelText: "البحث",
      enabled: enabled,
      labelStyle: context.textTheme.bodySmall,
      border: context.inputDecorationTheme.border,
      enabledBorder: context.inputDecorationTheme.enabledBorder,
      focusColor: context.inputDecorationTheme.focusColor,
      filled: true,
      fillColor: context.colors.surfaceContainerLowest,
    ),
    backgroundColor: context.scaffoldBackgroundColor,
    textStyle: context.textTheme.labelSmall,
    searchTextStyle: context.textTheme.bodySmall,
    flagSize: UISizes.sp20,
  );
}
