import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/components/app_list_tile.dart';
import 'package:eze/core/components/app_ribbon.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/extensions/routing.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class SelectorBottomSheetData<T> {
  final String title;
  final String? subTitle;
  final Widget? leading;
  final T id;
  final RibbonData? ribbon;
  final bool selected;

  const SelectorBottomSheetData({
    required this.title,
    this.subTitle,
    this.leading,
    required this.id,
    this.ribbon,
    this.selected = false,
  });
}

class SelectorBottomSheet extends StatelessWidget {
  final String? title;
  final Widget? header;
  final Widget? footer;
  final List<SelectorBottomSheetData> data;
  final bool showTrailing;

  const SelectorBottomSheet({
    super.key,
    this.header,
    this.footer,
    this.showTrailing = false,
    this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: UISizes.h8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(title, style: context.textTheme.labelMedium),
              AppIconButton(icon: AppIcons.close, onTap: context.pop),
            ],
          ),
          ?header,
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, _) => VGap.small(),
            itemBuilder: (_, i) => AppClick(
              onTap: () => context.pop(data[i].id),
              child: _item(data[i]),
            ),
            itemCount: data.length,
          ),
          ?footer,
        ],
      ),
    );
  }

  Widget _item(SelectorBottomSheetData data) => Builder(
    builder: (context) => AppRibbon(
      enabled: data.ribbon != null,
      data: data.ribbon,
      child: Container(
        decoration: BoxDecoration(
          color: data.selected ? context.colors.primary : null,
          border: Border.all(color: context.colors.surfaceContainerLow),
          borderRadius: BorderRadius.circular(UISizes.r12),
        ),
        child: AppListTile(
          showLeading: data.leading!=null,
          customLeading: data.leading,
          title: data.title,
          titleStyle: context.textTheme.labelSmall?.copyWith(
            color: data.selected ? context.colors.onPrimary : null,
          ),
          subtitle: data.subTitle,
          subtitleStyle: context.textTheme.bodySmall?.copyWith(
            color: data.selected ? context.colors.onPrimary : null,
          ),
          showTrailing: showTrailing,
        ),
      ),
    ),
  );
}
