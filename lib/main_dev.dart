import 'package:eze/core/routing/app_router.dart';
import 'package:eze/eze_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  await Future.wait([
    ScreenUtil.ensureScreenSize()
  ]) ;
  AppRouter router = AppRouter() ;
  runApp( EzeApp(router: router));
}
