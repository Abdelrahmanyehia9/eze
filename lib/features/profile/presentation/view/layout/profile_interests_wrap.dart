import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class ProfileInterestsWrap extends StatelessWidget {
  final List<String>? interests;

  const ProfileInterestsWrap({super.key, this.interests});

  @override
  Widget build(BuildContext context) {
    final interests = this.interests ?? [];
    return Wrap(
      spacing: UISizes.w4,
      runSpacing: UISizes.w4,
      children: List.generate(
        interests.length,
        (i) => AppChip(title: interests[i], marginHr: 0),
      ),
    );
  }
}
