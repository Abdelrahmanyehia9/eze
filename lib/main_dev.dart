import 'package:eze/core/di/get_it.dart';
import 'package:eze/core/routing/app_router.dart';
import 'package:eze/core/utils/app_configs.dart';
import 'package:eze/eze_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    AppConfigs.init(),
    DI.init(),
   initializeDateFormatting("ar")
  ]);
  AppRouter router = AppRouter();
  runApp(EzeApp(router: router));
}
