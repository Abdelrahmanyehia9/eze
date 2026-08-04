import 'package:eze/core/components/app_text_field.dart';
import 'package:flutter/material.dart';

class BioField extends StatelessWidget {
  const BioField({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppTextField(
      borderColor: Colors.transparent,
      headerText: "نبذة ",
      hintText: "تحدث عن نفسك ",
      maxLength: 1000,
      maxLines: 3,
    );
  }
}
