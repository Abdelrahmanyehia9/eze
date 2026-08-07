import 'package:eze/core/components/section_header.dart';
import 'package:eze/features/profile/presentation/view/layout/profile_interests_wrap.dart';
import 'package:flutter/material.dart';

class SettingsProfileInterests extends StatelessWidget {
  const SettingsProfileInterests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader.smallHeader("الهواايات", context: context),
        const ProfileInterestsWrap()

      ],
    );
  }
}
