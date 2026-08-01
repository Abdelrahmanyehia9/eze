library;

import 'package:eze/core/components/app_bottom_nav_bar.dart';
import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/chat/presentation/view/conversations_screen.dart';
import 'package:eze/features/home/presentation/view/home_screen.dart';
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
        topPadding: _pages[index].topPadding,
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
