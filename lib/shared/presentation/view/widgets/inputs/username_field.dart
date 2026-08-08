import 'package:eze/core/components/app_text_field.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController? controller;
  const UsernameField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return  AppTextField(
      controller: controller,
      borderColor: Colors.transparent,
      headerText: "اسم المستخدم",
      hintText:  "ادخل اسم المستحدم ",
      maxLength: 50,
    );
  }
}
