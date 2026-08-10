import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/shared/data/models/localized_string_model.dart';
import 'package:eze/core/utils/fake_data.dart';

class DictionaryEntity {
  final String uid;
  final LocalizedStringModel original;
  final List<LocalizedStringModel> translated;

  const DictionaryEntity({
    required this.uid,
    required this.original,
    required this.translated,
  });

  static DictionaryEntity fake() => DictionaryEntity(
    uid: FakeData.string(2),
    original: LocalizedStringModel.fake(),
    translated: LocalizedStringModel.fake().fakeList(),
  );
}
