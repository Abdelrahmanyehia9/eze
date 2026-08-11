library;

import 'package:eze/core/components/app_bottom_nav_bar.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/base_bloc_consumer.dart';
import 'package:eze/core/di/get_it.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/chat/presentation/controller/all_conversation_filters_cubit.dart';
import 'package:eze/features/chat/presentation/controller/all_conversations_cubit.dart';
import 'package:eze/features/chat/presentation/controller/conversation_requests_cubit.dart';
import 'package:eze/features/chat/presentation/view/conversations_screen.dart';
import 'package:eze/features/dictionary/presentation/controller/dictionary_filters_cubit.dart';
import 'package:eze/features/dictionary/presentation/controller/dictionary_words_cubit.dart';
import 'package:eze/features/dictionary/presentation/view/dictionary_screen.dart';
import 'package:eze/features/home/presentation/controller/boosted_users_cubit.dart';
import 'package:eze/features/home/presentation/controller/popular_groups_cubit.dart';
import 'package:eze/features/home/presentation/controller/unread_conversation_cubit.dart';
import 'package:eze/features/home/presentation/view/home_screen.dart';
import 'package:eze/features/profile/domain/entities/profile_entity.dart';
import 'package:eze/features/profile/presentation/controller/profile_cubit.dart';
import 'package:eze/features/profile/presentation/view/profile_screen.dart';
import 'package:eze/shared/domain/entities/conversation_entity.dart';
import 'package:eze/shared/presentation/controllers/selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eze/shared/presentation/controllers/main_layout_cubit.dart';
part 'main_layout_pages.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainLayoutCubit>();
    return BlocBuilder<MainLayoutCubit, int>(
      builder: (_, index) => AppScaffold(
        bottomPadding: false,
        hPadding: 0,
        topPadding: false,
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: index,
          onTap: cubit.changePage,
          items: _pages.navBars,
        ),
        body: IndexedStack(index: index, children: _pages.bodies),
      ),
    );
  }
}
