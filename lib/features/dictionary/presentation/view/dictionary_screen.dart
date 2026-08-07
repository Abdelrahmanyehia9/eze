import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/components/gap.dart';
import 'package:eze/core/components/overlays/app_widget_overlay.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/core/extensions/widgets.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';
import 'package:eze/features/dictionary/presentation/controller/dictionary_words_cubit.dart';
import 'package:eze/shared/presentation/view/widgets/buttons/share_button.dart';
import 'package:eze/features/dictionary/presentation/view/widgets/dictionary_word_card.dart';
import 'package:eze/shared/presentation/view/widgets/filter_chips.dart';
import 'package:eze/shared/presentation/view/widgets/inputs/search_field.dart';
import 'package:flutter/material.dart';

part 'layout/dictionary_list.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hPadding: 0,
      appBar: DefaultAppBar.logo(title: "قاموسي"),
      body: Column(
        spacing: UISizes.h16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchField(),
          const FilterChips(
            filters: ["الجميع", "فى الخروجات", "رومانسية", "تحيات", "+ اضافة"],
          ),
          Expanded(
            child: BaseBlocConsumer<DictionaryWordsCubit, List<DictionaryEntity>>(
              successBuilder: _buildDictList,
              loadingBuilder: () =>
                  _buildDictList(DictionaryEntity.fake().fakeList()),
            ),
          ),
        ],
      ).paddingHr,
    );
  }

  Widget _buildDictList(List<DictionaryEntity> words) => _DictionaryList(words);
}
