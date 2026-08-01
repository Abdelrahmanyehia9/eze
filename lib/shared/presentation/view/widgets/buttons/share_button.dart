import 'package:eze/core/components/app_icon_button.dart';
import 'package:eze/core/utils/app_icons.dart';

class ShareButton extends AppIconButton {
  const ShareButton({
    super.key,
    super.backgroundColor,
    super.color,
    super.size,
    super.onTap,
    super.radius,
  }) : super(icon: AppIcons.shareFilled);
}
