import 'package:flutter/material.dart';
import 'package:fso/core/constants/colors.dart';

class FSOTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscured;
  final void Function(String)? onChanged;
  const FSOTextField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscured = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscured,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'DMSans',
          fontWeight: FontWeight.w500,
          color: AppColors.kBorderColor,
          fontSize: 15.0,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: AppColors.kBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: AppColors.kBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
        isDense: true,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
