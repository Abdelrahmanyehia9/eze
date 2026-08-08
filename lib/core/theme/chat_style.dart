import 'package:flutter/material.dart';

@immutable
class ChatStyle extends ThemeExtension<ChatStyle> {
  final Color outgoingBubbleColor;
  final Color outgoingTextColor;
  final Color incomingBubbleColor;
  final Color incomingTextColor;
  final Color senderNameColor;
  final Color replyBackgroundColor;
  final Color replyBorderColor;
  final Color appBarBackgroundColor;
  final Color appBarForegroundColor;
  final String? chatBackgroundImage;
  final Color? chatBackgroundColor;
  final double fontSize ;

  const ChatStyle({
    required this.outgoingBubbleColor,
    required this.outgoingTextColor,
    required this.incomingBubbleColor,
    required this.incomingTextColor,
    required this.senderNameColor,
    required this.replyBackgroundColor,
    required this.replyBorderColor,
    required this.appBarBackgroundColor,
    required this.appBarForegroundColor,
    this.chatBackgroundColor,
    this.chatBackgroundImage,
     this.fontSize = 18
  });

  @override
  ChatStyle copyWith({
    Color? outgoingBubbleColor,
    Color? outgoingTextColor,
    Color? incomingBubbleColor,
    Color? incomingTextColor,
    Color? senderNameColor,
    Color? replyBackgroundColor,
    Color? replyBorderColor,
    Color? appBarBackgroundColor,
    Color? appBarForegroundColor,
    Color? backgroundColor,
    String? backgroundImage,
    double? fontSize
  }) {
    return ChatStyle(
      outgoingBubbleColor: outgoingBubbleColor ?? this.outgoingBubbleColor,
      outgoingTextColor: outgoingTextColor ?? this.outgoingTextColor,
      incomingBubbleColor: incomingBubbleColor ?? this.incomingBubbleColor,
      incomingTextColor: incomingTextColor ?? this.incomingTextColor,
      senderNameColor: senderNameColor ?? this.senderNameColor,
      replyBackgroundColor: replyBackgroundColor ?? this.replyBackgroundColor,
      replyBorderColor: replyBorderColor ?? this.replyBorderColor,
      appBarBackgroundColor:
          appBarBackgroundColor ?? this.appBarBackgroundColor,
      appBarForegroundColor:
          appBarForegroundColor ?? this.appBarForegroundColor,
      chatBackgroundColor: backgroundColor ?? chatBackgroundColor,
      chatBackgroundImage: backgroundImage ?? chatBackgroundImage,
      fontSize: fontSize ?? this.fontSize
    );
  }

  @override
  ChatStyle lerp(ThemeExtension<ChatStyle>? other, double t) {
    if (other is! ChatStyle) return this;

    return ChatStyle(
      outgoingBubbleColor: Color.lerp(
        outgoingBubbleColor,
        other.outgoingBubbleColor,
        t,
      )!,
      outgoingTextColor: Color.lerp(
        outgoingTextColor,
        other.outgoingTextColor,
        t,
      )!,
      incomingBubbleColor: Color.lerp(
        incomingBubbleColor,
        other.incomingBubbleColor,
        t,
      )!,
      incomingTextColor: Color.lerp(
        incomingTextColor,
        other.incomingTextColor,
        t,
      )!,
      senderNameColor: Color.lerp(senderNameColor, other.senderNameColor, t)!,
      replyBackgroundColor: Color.lerp(
        replyBackgroundColor,
        other.replyBackgroundColor,
        t,
      )!,
      replyBorderColor: Color.lerp(
        replyBorderColor,
        other.replyBorderColor,
        t,
      )!,
      appBarBackgroundColor: Color.lerp(
        appBarBackgroundColor,
        other.appBarBackgroundColor,
        t,
      )!,
      appBarForegroundColor: Color.lerp(
        appBarForegroundColor,
        other.appBarForegroundColor,
        t,
      )!,
      chatBackgroundColor: Color.lerp(
        chatBackgroundColor,
        other.chatBackgroundColor,
        t,
      ),
      chatBackgroundImage: other.chatBackgroundImage,

    );
  }
}
