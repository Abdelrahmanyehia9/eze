import 'package:eze/core/components/app_text_field.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      borderColor: Colors.transparent,
      headerText: "البريد الالكتروني",
      hintText:  "مثال info@example.com ",
    );

  }
}
