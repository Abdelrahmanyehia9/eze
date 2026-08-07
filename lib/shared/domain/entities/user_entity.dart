import 'package:equatable/equatable.dart';
import 'package:eze/core/utils/fake_data.dart';

class UserEntity extends Equatable {
  final String uid;
  final String username;
  final String? image;

  const UserEntity({
    required this.uid,
    required this.username,
     this.image,
  });

  @override
  List<Object?> get props => [uid];

  static UserEntity fake() => UserEntity(
    uid: FakeData.string(),
    username: FakeData.string(),
    image: FakeData.string(),
  );
}
