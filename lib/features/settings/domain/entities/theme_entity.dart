import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:flutter/material.dart';

class ThemeEntity {
  final ThemeMode mode;
  final ChatStyle chatTheme;

  const ThemeEntity({required this.mode, required this.chatTheme});

  static ThemeEntity fake() =>
      const ThemeEntity(mode: ThemeMode.light, chatTheme: AppChatTheme.defaultLight
      );


  String get fontSizeStr=>switch(chatTheme.fontSize){
    <16 => "صغير",
    <22 => "متوسط",
   _=>"كبير"
  };
}
