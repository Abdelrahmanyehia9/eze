import 'package:country_picker/country_picker.dart';
import 'package:eze/core/utils/fake_data.dart';

class LocalizedStringModel {
  final String string;

  final Country country;

  LocalizedStringModel(this.string, this.country);

  static LocalizedStringModel fake([String? country]) =>
      LocalizedStringModel(FakeData.string(3), Country.parse(country ?? "EG"));
}
