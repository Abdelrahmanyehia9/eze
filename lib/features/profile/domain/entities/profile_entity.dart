import 'package:country_picker/country_picker.dart';
import 'package:eze/core/enums/gender.dart';
import 'package:eze/core/enums/profile_interests.dart';
import 'package:eze/core/enums/rank.dart';
import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/shared/data/models/phone_number_model.dart';
import 'package:eze/shared/data/models/typed_media_model.dart';
import 'package:eze/shared/domain/entities/user_entity.dart';

class ProfileEntity extends UserEntity {
  final String? email;
  final String? bio;
  final List<ProfileInterests>? interests;
  final String? cover;
  final Gender? gender;

  final DateTime? birthDate;

  final List<TypedMediaModel> gallery;
  final Rank rank;
  final Country? country;
  final PhoneNumberModel? phone;

  const ProfileEntity({
    required super.uid,
    required super.username,
    super.image,
    this.email,
    this.bio,
    this.interests,
    this.cover,
    this.gallery = const[] ,
    this.gender,
    this.birthDate,
    this.rank = Rank.bronze,
    this.country,
    this.phone,
  });


  static ProfileEntity fake() => ProfileEntity(
    uid: FakeData.string(),
    username: FakeData.string(),
    bio: FakeData.string(24),
    interests: FakeData.list<ProfileInterests>(ProfileInterests.animals),
  );


  String? get loginProviderStr => email ?? phone?.phoneWithCountryCode ;

}

extension ProfileEntityExt on ProfileEntity {
  List<Object?> get _fields => [
    username,
    uid,
    image,
    email,
    bio,
    interests,
    cover,
    gender,
    birthDate,
    gallery,
    rank,
    country,
    phone,
  ];

  List<Object> get _unNullable => _fields.whereType<Object>().toList();

  bool get isCompleted => _fields.every((e) => e != null);

  double get progress => _unNullable.length / _fields.length;
}
