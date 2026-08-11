import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  final List<String> filters;
  final int activeIndex;
  final ValueChanged<int>?onChanged ;
  const FilterChips({super.key, this.onChanged, required this.filters, this.activeIndex = 0});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: UISizes.w4,
        children: List.generate(filters.length, (i) {
          final bool selected = i == activeIndex;
          return AppClick(
              onTap: (){
                if(!selected){
                  onChanged?.call(i);
                }
              },

              child: _FilterChip(text: filters[i], isSelected: selected));
        }),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _FilterChip({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return AppChip(
      title: text,
      titleStyle: context.textTheme.bodySmall,
      titleColor: isSelected
          ? context.colors.primary
          : context.colors.surfaceContainer,
      color: isSelected ? context.colors.primary.veryLight : Colors.transparent,
      borderColor: isSelected
          ? context.colors.primary
          : context.colors.surfaceContainerLow,
      borderWidth: 0.5,
    );
  }
}
