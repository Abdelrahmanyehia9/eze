import 'package:eze/core/components/app_text_field.dart';
import 'package:eze/core/extensions/date_time.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class DateField extends StatefulWidget {
  final bool showHeader;
  final DateTime? initialDate;
  const DateField({super.key, this.initialDate, this.showHeader = true});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController _dateController = TextEditingController();
  @override
  void initState() {
    _dateController.text = widget.initialDate?.toBirthDateForm() ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: _dateController,
      borderColor: Colors.transparent,
      headerText: widget.showHeader ? "تاريخ الميلاد" : null,
      hintText: "ادخل تاريخ الميلاد",
      readOnly: true,
      suffix: const Icon(AppIcons.calender),
    );
  }
}
