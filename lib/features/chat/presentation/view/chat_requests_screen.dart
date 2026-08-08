import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/presentation/view/layout/conversation_list.dart';
import 'package:flutter/material.dart';

class ChatRequestsScreen extends StatelessWidget {
  final List<ConversationEntity> conversations;

  const ChatRequestsScreen({super.key, required this.conversations});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const DefaultAppBar(title: "طلبات المراسلة",
      centerTitle: true,
      ),
      body: ConversationList(conversations: conversations),
    );
  }
}
