import 'package:country_picker/country_picker.dart';
import 'package:eze/core/enums/gender.dart';
import 'package:eze/core/enums/profile_interests.dart';
import 'package:eze/core/enums/rank.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/shared/data/models/typed_media_model.dart';

class ProfileRemoteDatasource {
  Future<ProfileEntity> getProfile([String? id]) async {
    return ProfileEntity(
      uid: "1",
      username: "امينه خليل",
      email: "Amina@gmail.com",
      image:
          "https://media0106.elcinema.com/uploads/_315x420_4c88ff61b2e7811c462fefa529ac878bab29c0c878b44fa2a1ebd9a79f477efe.jpg",
      bio:
          "أحب القراءة والسفر واكتشاف أماكن جديدة، وأسعى دائمًا لتطوير نفسي وخوض تجارب مختلفة.",
      birthDate: DateTime(2002, 5, 18),
      gender: Gender.female,
      country: Country.parse("EG"),
      interests: const [
        ProfileInterests.reading,
        ProfileInterests.travel,
        ProfileInterests.cooking,
        ProfileInterests.art,
      ],
      cover: "https://bitajarod.com/wp-content/uploads/2025/10/aminakhalil.jpg",
      gallery: const [
        TypedMediaModel(
          "https://image.tmdb.org/t/p/w500/eHJBpaypMN52VSIF84r5MgvC0Mr.jpg",
        ),
        TypedMediaModel(
          "https://pbs.twimg.com/profile_images/743963783933136896/Xn40O39t_400x400.jpg",
        ),
        TypedMediaModel(
          "https://identity-mag.com/wp-content/uploads/2025/12/%D9%81%D9%8A%D9%87-%D9%86%D8%A7%D8%B3-%D8%A8%D8%AA%D8%AD%D9%84%D9%85%E2%80%A6%D9%88%D9%81%D9%8A%D9%87-%D9%86%D8%A7%D8%B3-%D8%AA%D9%85%D8%B4%D9%8A-%D9%88%D8%B1%D8%A7-%D8%A7%D9%84%D8%AD%D9%84%D9%85-%D9%84%D8%A2%D8%AE%D8%B1%D9%87.%D8%A3%D9%85%D9%8A%D9%86%D8%A9-%D8%AE%D9%84%D9%8A%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D9%86%D8%A7%D8%B3-%D8%A7%D9%84%D9%84%D9%8A-%D8%A7%D8%AE%D8%AA%D8%A7%D8%B1%D8%AA-%D8%AA%D9%88%D8%A7%D8%AC%D9%87-%D8%B4%D9%83%D9%91%D9%87%D8%A7%D8%8C-%D8%AA%D9%81%D9%87%D9%85-%D9%86%D9%81-2-e1764929361892-1024x664.jpg",
        ),
      ],
      rank: Rank.silver,
    );
  }
}
