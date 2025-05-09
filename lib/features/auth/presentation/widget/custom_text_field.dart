import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.text400),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.muted300)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.muted300)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.muted300)),
      ),
    );
  }
}