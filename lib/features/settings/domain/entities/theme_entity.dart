import 'package:eze/core/theme/app_chat_theme.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:flutter/material.dart';
enum ChatFontTypes{
  small , medium , largs ;
  String get text => switch(this){
    small => "صغير",
    medium => "متوسط",
    largs => "كبير"
  };
  double get size => switch(this){
    small => 14,
    medium => 18,
    largs => 22
  };
}




class ThemeEntity {
  final ThemeMode mode;
  final ChatStyle chatTheme;

  const ThemeEntity({required this.mode, required this.chatTheme});

  static ThemeEntity fake() => const ThemeEntity(
    mode: ThemeMode.light,
    chatTheme: AppChatTheme.defaultLight,
  );



  ThemeEntity copyWith({ThemeMode? mode, ChatStyle? chatTheme}) => ThemeEntity(
    mode: mode ?? this.mode,
    chatTheme: chatTheme ?? this.chatTheme,
  );
}
