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
    body: const HomeScreen(),
  ),
  _MainLayoutPage(
    navbar: const BottomNavItem(
      icon: AppIcons.bubbleSquare,
      selectedIcon: AppIcons.bubbleSquareFilled,
      title: "دردشة",
      badge: "",
    ),
    body: const ConversationsScreen(),
  ),

  _MainLayoutPage(
    navbar: const BottomNavItem(
      icon: AppIcons.saved,
      selectedIcon: AppIcons.savedFilled,
      title: "قاموسى",
    ),
    body: const DictionaryScreen(),
  ),

  _MainLayoutPage(
    navbar: const BottomNavItem(icon: AppIcons.profileCircle, title: "الملف "),
    body: const ProfileScreen(),
  ),
];

extension _MainLayoutPages on List<_MainLayoutPage> {
  List<BottomNavItem> get navBars => map((e) => e.navbar).toList();
  List<Widget> get bodies => map((e) => e.body).toList();
}
