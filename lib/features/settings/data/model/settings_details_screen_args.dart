
import 'package:flutter/material.dart';

class SettingDetailsScreenArgs {
  final String title;
  final String? info;
  final Widget body;

  SettingDetailsScreenArgs({
    required this.title,
    this.info,
    required this.body,
  });
}