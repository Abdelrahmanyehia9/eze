part of 'main_layout.dart';

class _MainLayoutPage {
  final BottomNavItem navbar;
  final Widget body;

  _MainLayoutPage({required this.navbar, required this.body});
}

final List<_MainLayoutPage> _pages = [
  _MainLayoutPage(
    navbar: const BottomNavItem(
      icon: AppIcons.home,
      selectedIcon: AppIcons.homeFilled,
      title: "الرئيسية",
    ),
    body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<BoostedUsersCubit>()..getBoostedUsers(),
        ),
        BlocProvider(
          create: (context) =>
              sl<UnreadConversationCubit>()..getUnreadConversations(),
        ),
        BlocProvider(
          create: (context) =>
              sl<PopularGroupsCubit>()..getPopularGroupsConversations(),
        ),
      ],
      child: const HomeScreen(),
    ),
  ),
  _MainLayoutPage(
    navbar: const BottomNavItem(
      icon: AppIcons.bubbleSquare,
      selectedIcon: AppIcons.bubbleSquareFilled,
      title: "دردشة",
      badge: "",
    ),
    body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<AllConversationsCubit>()..getAllConversations(),
        ),
        BlocProvider(
          create: (context) =>
              sl<ConversationRequestsCubit>()..getConversationRequests(),
        ),
        BlocProvider(create: (context) => SelectionCubit<ConversationEntity>()),
        BlocProvider(
          create: (context) => sl<AllConversationFiltersCubit>()..init(),
        ),
      ],
      child: const ConversationsScreen(),
    ),
  ),

  _MainLayoutPage(
    navbar: const BottomNavItem(
      icon: AppIcons.saved,
      selectedIcon: AppIcons.savedFilled,
      title: "قاموسى",
    ),
    body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<DictionaryWordsCubit>()..getAllWordsByFilters(),
        ),
        BlocProvider(create: (context) => sl<DictionaryFiltersCubit>()..init()),
      ],
      child: const DictionaryScreen(),
    ),
  ),

  _MainLayoutPage(
    navbar: const BottomNavItem(icon: AppIcons.profileCircle, title: "الملف "),
    body: BaseBlocConsumer<ProfileCubit, ProfileEntity>(
      successBuilder: (p) => ProfileScreen(profile: p),
      loadingBuilder: () => ProfileScreen(profile: ProfileEntity.fake()),
    ),
  ),
];

extension _MainLayoutPages on List<_MainLayoutPage> {
  List<BottomNavItem> get navBars => map((e) => e.navbar).toList();

  List<Widget> get bodies => map((e) => e.body).toList();
}
