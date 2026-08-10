import 'package:eze/core/utils/fake_data.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';

class BoostedUsersRemoteDatasource {
  Future<List<ConversationPeerEntity>> getBoostedUsers() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      ConversationPeerEntity(
        uid: "uid0",
        name: "حازم احمد",
        image:
            "https://img.magnific.com/free-photo/portrit-trendy-handsome-man-sunglasses-photo-studio_613910-5880.jpg?semt=ais_hybrid&w=740&q=80",
        lastOnline: FakeData.dateTime,
      ),
      ConversationPeerEntity(
        uid: "uid1",
        name: "اميرة",
        image:
            "https://img.magnific.com/free-photo/front-view-business-woman-suit_23-2148603018.jpg?semt=ais_test_b&w=740&q=80",
        lastOnline: FakeData.dateTime,
      ),
      ConversationPeerEntity(
        uid: "uid2",
        name: "مى سالم",
        image:
            "https://static.vecteezy.com/system/resources/thumbnails/049/005/556/small/profile-shot-of-a-beautiful-young-brunette-with-wind-swept-hair-against-a-white-backdrop-photo.jpg",
        lastOnline: FakeData.dateTime,
      ),
      ConversationPeerEntity(
        uid: "uid3",
        name: "مروان",
        lastOnline: DateTime.now(),
      ),
    ];
  }
}
