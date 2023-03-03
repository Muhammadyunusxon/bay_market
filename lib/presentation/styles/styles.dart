import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Style {
  Style._();

  static const textColor = Color(0xff022B4A);
  static const primaryColor = Color(0xff033C67);
  static const whiteColor = Color(0xffFFFFFF);
  static const strokeColor = Color(0xffE4EFF3);
  static const greyDarkColor = Color(0xff8CA6B7);
  static const backgroundColor = Color(0xffF6F8FA);
  static const bgColor = Color(0xffE7F8FF);
  static const transparent = Colors.transparent;

  static textStyleNormal(
      {double size = 16, Color textColor = textColor, bool isActive = false}) {
    return GoogleFonts.urbanist(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.normal,
      decoration: isActive ? TextDecoration.lineThrough : TextDecoration.none,
    );
  }

  static myDecoration(
      {required String title,
      Color? titleColor,
      Color? fillColor,
      Widget? prefixIcon,
      Widget? suffixIcon,
      Color? borderColor}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      prefixIconConstraints: const BoxConstraints(maxHeight: 18),
      hintText: title,
      prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: prefixIcon),
      suffixIcon: suffixIcon,
      hintStyle: Style.textStyleNormal(
          textColor: titleColor ?? greyDarkColor.withOpacity(0.6), size: 15),
      filled: true,
      fillColor: fillColor ?? backgroundColor.withOpacity(0.2),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor ?? strokeColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor ?? strokeColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor ?? strokeColor)),
    );
  }
}
