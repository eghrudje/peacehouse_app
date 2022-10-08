
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'custom_text_widget.dart';
class CustomTextFormField extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? title;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool? enabled;
  final bool obscureText;
  final bool isPhone;
  final String? authPrefix;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? obscuringCharacter;
  final List<TextInputFormatter>? inputFormatters;


  const CustomTextFormField({
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.hintText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.onTap,
    this.autoFocus = false,
    this.focusNode,
    this.maxLength,
    this.title,
    this.enabled,
    this.suffix,
    this.inputFormatters,
    this.isPhone = false,
    this.authPrefix,
});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        _hasFocus = hasFocus;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title != null)
              Row(
                mainAxisAlignment:
                (widget.title == 'To' || widget.title == 'From')
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: customText(
                      widget.title!,
                      fontSize: 12,
                      color: _hasFocus ? AppColors.primary : AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            TextFormField(
              cursorColor: AppColors.black.withOpacity(0.4),
              cursorWidth: 1,
              focusNode: widget.focusNode,
              maxLines: widget.maxLines,
              autofocus: widget.autoFocus,
              enabled: widget.enabled ?? true,
              maxLength: widget.maxLength,
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.textInputAction,
              style: GoogleFonts.josefinSans(
                color: AppColors.black,
                fontSize: 14,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w500,
              ),
              readOnly: widget.readOnly,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.all(15),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.josefinSans(
                  color: AppColors.grey2,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: AppColors.white,
                errorStyle: GoogleFonts.josefinSans(
                  color: AppColors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: widget.isPhone
                    ? IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            customText(
                              '+234',
                              color: _hasFocus
                                  ? AppColors.primary
                                  : AppColors.grey2,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                          color: _hasFocus
                              ? AppColors.primary
                              : AppColors.grey2,
                          thickness: 1)
                    ],
                  ),
                )
                    : widget.authPrefix != null
                    ? Container(
                  width: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/${widget.authPrefix}.png',
                        height: 20,
                        width: 20,
                        color: _hasFocus
                            ? AppColors.primary
                            : AppColors.grey2,
                      )
                    ],
                  ),
                )
                    : widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                suffix: widget.suffix,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey2,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey2,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              obscureText: widget.obscureText,
              onTap: widget.onTap,
              obscuringCharacter: '●',
              controller: widget.controller,
              textAlign: widget.textAlign ?? TextAlign.start,
              keyboardType: widget.textInputType,
              validator: widget.validator,
              onChanged: widget.onChanged,
            )
          ],
        ),
      ),
    );
  }
}
