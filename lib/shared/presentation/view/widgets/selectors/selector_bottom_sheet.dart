import 'package:eze/core/components/app_click.dart';
import 'package:eze/core/components/app_icon_button.dart';
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
  final T id ;
  final RibbonData? ribbon ;

  const SelectorBottomSheetData({
    required this.title,
    this.subTitle,
    this.leading,
    required this.id,
    this.ribbon
  });
}

class SelectorBottomSheet extends StatelessWidget {
  final String? title;
  final Widget? header ;
  final Widget? footer ;
  final List<SelectorBottomSheetData> data;
  final bool showTrailing ;
  const SelectorBottomSheet({super.key, this.header, this.footer, this.showTrailing = false, this.title, required this.data});

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
            separatorBuilder: (_,_)=>VGap.small(),
            itemBuilder: (_, i) => AppClick(
                onTap: ()=> context.pop(data[i].id),
                child: _item(data[i])),
            itemCount: 2,
          ),
          ?footer
        ],
      ),
    );
  }

  Widget _item(SelectorBottomSheetData data) => Builder(
    builder: (context) {
      return AppRibbon(
        enabled: data.ribbon!=null,
        data: data.ribbon,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colors.surfaceContainerLow),
            borderRadius: BorderRadius.circular(UISizes.r12),
          ),
          child: ListTile(
            leading: data.leading,
            title: AppText(
              data.title,
              style: context.textTheme.labelSmall,
              height: 0,
            ),
            subtitle: data.subTitle == null
                ? null
                : AppText(
                    data.subTitle,
                    style: context.textTheme.bodySmall,
                    color: context.colors.surfaceContainer,
                  ),
            trailing:showTrailing ?  Icon(
              AppIcons.arrowForward,
              color: context.colors.surfaceContainer,
            ) : null,
          ),
        ),
      );
    },
  );
}
