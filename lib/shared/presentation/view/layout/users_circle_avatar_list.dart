import 'package:eze/core/components/gap.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class UsersCircleAvatarList extends StatelessWidget {
  final double size;
  const UsersCircleAvatarList({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (_, i) => UserCircleAvatar.withName(size: size * .82),
        separatorBuilder: (_, _) => HGap.small(),
        itemCount: 12,
      ),
    );
  }
}
