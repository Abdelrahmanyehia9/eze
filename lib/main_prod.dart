import 'package:eze/core/routing/app_router.dart';
import 'package:eze/eze_app.dart';
import 'package:flutter/material.dart';

void main() {
  AppRouter router = AppRouter() ;
  runApp( EzeApp(router: router));
}
