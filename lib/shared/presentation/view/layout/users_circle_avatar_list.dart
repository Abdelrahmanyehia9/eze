import 'package:eze/core/components/gap.dart';
import 'package:eze/core/extensions/fake_data.dart';
import 'package:eze/shared/domain/entities/conversation_peer_entity.dart';
import 'package:eze/shared/presentation/view/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

class UsersCircleAvatarList extends StatelessWidget {
  final double size;
  final List<ConversationPeerEntity>? users;

  const UsersCircleAvatarList({super.key, this.users, required this.size});

  @override
  Widget build(BuildContext context) {
    final users = this.users ?? ConversationPeerEntity.fake.fakeList();
    return SizedBox(
      height: size,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (_, i) => UserCircleAvatar.withName(
          size: size * .82,
          username: users[i].name,
          image: users[i].image,
        ),
        separatorBuilder: (_, _) => HGap.small(),
        itemCount: users.length,
      ),
    );
  }
}
