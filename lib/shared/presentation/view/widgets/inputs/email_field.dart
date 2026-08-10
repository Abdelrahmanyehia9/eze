import 'package:eze/core/components/app_text_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  const EmailField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      borderColor: Colors.transparent,
      headerText: "البريد الالكتروني",
      hintText: "مثال info@example.com ",
    );
  }
}
