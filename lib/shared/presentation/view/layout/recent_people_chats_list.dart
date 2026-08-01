import 'package:eze/core/components/gap.dart';
import 'package:eze/core/components/section_header.dart' show SectionHeader;
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class RecentPeopleChatsList extends StatelessWidget {
  final bool showTitle;
  final Widget? start;
  final double? size;

  const RecentPeopleChatsList({
    super.key,
    this.size,
    this.start,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final double size = this.size ?? UISizes.sp96;
    return Column(
      spacing: UISizes.h8,
      children: [
        if (showTitle) const SectionHeader(title: "رسائل مباشرة"),
        SizedBox(
          height: size,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemBuilder: (_, i) {
              if (start != null && i == 0) return start;
              return UserCircleAvatar.withName(size: size * .8);
            },
            separatorBuilder: (_, _) => HGap.small(),
            itemCount: 12 + (start != null ? 0 : 1),
          ),
        ),
      ],
    );
  }
}
