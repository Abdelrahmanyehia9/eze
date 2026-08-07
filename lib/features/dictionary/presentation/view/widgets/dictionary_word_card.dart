import 'package:eze/core/components/app_card.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/extensions/sizes.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:flutter/material.dart';

class DictionaryWordCard extends StatelessWidget {
  final DictionaryEntity dictionaryEntity ;
  const DictionaryWordCard({super.key, required this.dictionaryEntity});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: SizedBox(
        width: context.width,
        child:  Column(
          children: [
            AppText("${dictionaryEntity.original.country.flagEmoji} ${dictionaryEntity.original.string}"),
            ...dictionaryEntity.translated.map((e)=>AppText("${e.country.flagEmoji} ${e.string}"))
          ],
        ),
      ),
    );
  }
}
