import 'package:eze/core/components/app_chip.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:flutter/material.dart';

class ProfileInterestsWrap extends StatelessWidget {
  const ProfileInterestsWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: UISizes.w4,
      runSpacing: UISizes.w4,
      children: List.generate(8, (i) => const AppChip(
        title: "القراءة", marginHr: 0,)),
    );
  }
}
