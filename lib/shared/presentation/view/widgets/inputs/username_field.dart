import 'package:eze/core/components/app_text_field.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      borderColor: Colors.transparent,
      headerText: "اسم المستخدم",
      hintText:  "ادخل اسم المستحدم ",
      maxLength: 50,
    );
  }
}
