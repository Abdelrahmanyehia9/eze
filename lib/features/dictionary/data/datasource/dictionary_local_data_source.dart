import 'package:country_picker/country_picker.dart';
import 'package:eze/shared/data/models/localized_string_model.dart';
import 'package:eze/features/dictionary/domain/entities/dictionary_entity.dart';

class DictionaryLocalDataSource {



Future<List<DictionaryEntity>>getDictionaryWords()async=>[
  DictionaryEntity(
      uid: "1",
      original: LocalizedStringModel("مرحيا يا صديقي ", Country.parse("SA")),
      translated: [
        LocalizedStringModel("How are you My friend", Country.parse("US")
        )
      ]
  ),
  DictionaryEntity(
      uid: "1",
      original: LocalizedStringModel("شكرا ", Country.parse("SA")),
      translated: [
        LocalizedStringModel("Thanks", Country.parse("US")
        ),
        LocalizedStringModel("Danke!", Country.parse("DE")
        )
      ]
  )
] ;



}