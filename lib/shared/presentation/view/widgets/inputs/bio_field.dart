import 'package:eze/core/components/app_text_field.dart';
import 'package:flutter/material.dart';

class BioField extends StatelessWidget {
  final TextEditingController? controller;
  const BioField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      borderColor: Colors.transparent,
      headerText: "نبذة ",
      hintText: "تحدث عن نفسك ",
      maxLength: 1000,
      maxLines: 3,
    );
  }
}
