

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'custom_text_widget.dart';

Widget CustomButton (
    String text, {
    Color? buttonColor,
    Color? textColor,
    Function()? onTap,
    Color? borderColor,
    FontWeight? fontWeight,
    double? fontSize,
    double? horiMargin,
    double? borderRadius,
    String? icon,
    Color? iconColor,
    double? height,
    double? width,
    bool busy = false,
    bool isActive = true,
    bool isGradient = true,
}) {
  return InkWell(
    onTap: isActive ? (busy ? null : onTap) : null,
    child: Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: horiMargin ?? 0),
      decoration: BoxDecoration(
          color: isActive ? buttonColor : buttonColor!.withOpacity(.6),
          borderRadius: BorderRadius.circular(borderRadius ?? 4),
          border: Border.all(
              width: 1,
              color: isActive
                  ? buttonColor == AppColors.primary? Colors.transparent: (borderColor ?? Colors.transparent)
                  : const Color(0xffF6F6F6))),
      child: Center(
          child: busy
              ? SizedBox(
            height: 20,
            width: 20,
            child: const CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
              : customText(
                text,
                color: isActive ? textColor : textColor!.withOpacity(.6),
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.w600,
              )),
    ),
  );
}