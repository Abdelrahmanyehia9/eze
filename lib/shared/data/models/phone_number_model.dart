class PhoneNumberModel {
  final String countryCode;

  final String phone;

  const PhoneNumberModel(this.countryCode, this.phone);

  String get phoneWithCountryCode => "$countryCode $phone";
}
