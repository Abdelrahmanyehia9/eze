import 'package:eze/core/routing/app_router.dart';
import 'package:eze/core/routing/routes.dart';
import 'package:eze/core/services/navigation_service.dart';
import 'package:eze/core/theme/app_scroll_behavior.dart';
import 'package:eze/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EzeApp extends StatelessWidget {
  final AppRouter router;
  const EzeApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
          scrollBehavior: AppScrollBehavior(),
          onGenerateRoute: router.generateRoute,
          initialRoute: Routes.main,
          theme: AppTheme.lightTheme(),
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme(),
          builder: (context, routerChild) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.noScaling),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: routerChild!,
              ),
            );
          },
        );
      },
    );
  }
}
