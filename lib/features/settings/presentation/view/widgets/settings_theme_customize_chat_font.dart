import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/overlays/bottom_sheets.dart';
import 'package:eze/core/components/section_header.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/features/chat/presentation/view/widgets/chat_bubble.dart';
import 'package:eze/features/settings/domain/entities/theme_entity.dart';
import 'package:eze/shared/presentation/view/widgets/selectors/selector_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SettingsThemeCustomizeChatFont extends StatelessWidget {
  final ChatFontTypes font;
  final ValueChanged<ChatFontTypes>? onChanged ;
  const SettingsThemeCustomizeChatFont({super.key,  this.onChanged, required this.font});


  Future<void>_onSelect()async{
    final fonts = ChatFontTypes.values;
    final result = await BottomSheets.show(
      child: SelectorBottomSheet(
        data: List.generate(
          fonts.length,
              (i) => SelectorBottomSheetData<ChatFontTypes>(
            title: fonts[i].text,
            selected: fonts[i]== font,
            id: fonts[i],
          ),
        ),
      ),
    );
    if(result !=null && result !=font )return onChanged?.call(result);
  }
  @override
  Widget build(BuildContext context) {
    final fontSize = font.size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: "الخط",
          action: "تخصيص",
          onAction: _onSelect,
          actionStyle: context.textTheme.titleSmall,
        ),
        ChatBubbleContainer(
          isMe: true,
          bubbleColor: context.colors.primary,
          child: AppText(
            "هذا مثال بسيط لمعاينة النص بالحجم الحالى (${font.text}).",
            color: context.colors.onPrimary,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
