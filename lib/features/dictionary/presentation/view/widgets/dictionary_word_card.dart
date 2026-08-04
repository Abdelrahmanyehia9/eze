import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:flutter/material.dart';

class DictionaryWordCard extends StatelessWidget {
  const DictionaryWordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: SizedBox(
        width: context.width,
        child: const Column(
          children: [
            AppText("🇪🇬 ازيك يا صاحبي"),
            AppText("🇺🇸 How are you guy"),
          ],
        ),
      ),
    );
  }
}
