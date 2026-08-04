
import 'package:eze/core/theme/app_colors.dart';
import 'package:eze/core/theme/chat_style.dart';
import 'package:eze/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class AppChatTheme {
  const AppChatTheme._();
  static const List<ChatStyle>themes = [defaultLight, defaultDark, tealStyle , hotStyle , blackLover, beachStyle] ;
  static const ChatStyle defaultLight = ChatStyle(
      outgoingBubbleColor: AppColors.white,
      outgoingTextColor: AppColors.black,
      incomingBubbleColor: AppColors.primary,
      incomingTextColor: AppColors.white,
      senderNameColor: AppColors.primary100,
      replyBackgroundColor: Color.fromRGBO(0, 0, 0, 0.05),
      replyBorderColor: AppColors.primary200,
      appBarBackgroundColor: AppColors.primary,
      appBarForegroundColor: AppColors.white,
      chatBackgroundImage: AppAssets.defaultChatBackground,
  );
  static const ChatStyle defaultDark = ChatStyle(
    outgoingBubbleColor: AppColors.black,
    outgoingTextColor: AppColors.white,
    incomingBubbleColor: AppColors.primary400,
    incomingTextColor: AppColors.white,
    senderNameColor: AppColors.primary100,
    replyBackgroundColor: Color.fromRGBO(255, 255, 255, 0.05),
    replyBorderColor: AppColors.secondary,
    appBarBackgroundColor: AppColors.primary400,
    appBarForegroundColor: AppColors.white,

  );
  static const ChatStyle tealStyle = ChatStyle(
    outgoingBubbleColor:Color(0xFF00D9FF),
    outgoingTextColor: Colors.white,
    incomingBubbleColor: Colors.teal,
    incomingTextColor: AppColors.white,
    senderNameColor: Color(0xFFB2DFDB),
    chatBackgroundColor: Color(0xFFD1F3F0),
    replyBackgroundColor: Color.fromRGBO(0, 0, 0, 0.05),
    replyBorderColor: Colors.orange,
    appBarBackgroundColor: Colors.teal,
    appBarForegroundColor: AppColors.white,

  );
  static const ChatStyle hotStyle = ChatStyle(
    outgoingBubbleColor:Color(0xFFFFE0B2),
    outgoingTextColor: Colors.black,
    incomingBubbleColor: Colors.red,
    incomingTextColor: AppColors.white,
    senderNameColor: Color(0xFFE57373),
    chatBackgroundColor: Color(0xFFEFC890),
    replyBackgroundColor: Color.fromRGBO(0, 0, 0, 0.05),
    replyBorderColor: Colors.yellow,
    appBarBackgroundColor: Colors.red,
    appBarForegroundColor: AppColors.white,

  );
  static const ChatStyle blackLover = ChatStyle(
    outgoingBubbleColor: AppColors.grey700,
    outgoingTextColor: Colors.white,
    incomingBubbleColor: AppColors.black,
    incomingTextColor: AppColors.white,
    senderNameColor: AppColors.grey300,
    chatBackgroundColor: AppColors.grey900,
    replyBackgroundColor: Color.fromRGBO(255, 255, 255, 0.05),
    replyBorderColor: Colors.grey,
    appBarBackgroundColor: AppColors.black,
    appBarForegroundColor: AppColors.white,

  );
  static const ChatStyle beachStyle = ChatStyle(
    outgoingBubbleColor: Color(0xFFFFF59D),
    outgoingTextColor: Colors.black,
    incomingBubbleColor: Colors.blue,
    incomingTextColor: AppColors.white,
    senderNameColor: Colors.blueAccent,
    chatBackgroundColor: AppColors.white,
    chatBackgroundImage: AppAssets.beachChatBackGround,
    replyBackgroundColor: Color.fromRGBO(255, 255, 255, 0.05),
    replyBorderColor: Colors.yellow,
    appBarBackgroundColor: Colors.blueAccent,
    appBarForegroundColor: AppColors.white,

  );


}
