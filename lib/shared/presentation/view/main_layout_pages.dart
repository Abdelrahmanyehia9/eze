part of 'main_layout.dart';

class _MainLayoutPage {
  final BottomNavItem navbar;
  final Widget body;
  final bool topPadding;

  _MainLayoutPage({
    required this.navbar,
    required this.body,
    this.topPadding = true,
  });
}

final List<_MainLayoutPage> _pages = [
  _MainLayoutPage(
    topPadding: false,
    navbar: const BottomNavItem(
      icon: AppIcons.home,
      selectedIcon: AppIcons.homeFilled,
      title: "الرئيسية",
    ),
    body: const HomeScreen(),
  ),
  _MainLayoutPage(
    topPadding: false,
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
      icon: AppIcons.megaPhone,
      selectedIcon: AppIcons.megaPhoneFilled,
      title: "القنوات",
    ),
    body: const SizedBox(),
  ),

  _MainLayoutPage(
    navbar: const BottomNavItem(icon: AppIcons.profileCircle, title: "الملف "),
    body: const SizedBox(),
  ),
];

extension _MainLayoutPages on List<_MainLayoutPage> {
  List<BottomNavItem> get navBars => map((e) => e.navbar).toList();
  List<Widget> get bodies => map((e) => e.body).toList();
}
