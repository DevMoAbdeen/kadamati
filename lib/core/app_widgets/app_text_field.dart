import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.labelText,
    this.prefixIcon,
    this.backgroundColor = Colors.white,
    this.height,
    this.borderRadius = 10,
    this.readOnly = false,
    this.autofocus = false,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLine,
    this.onClickSuffix,
    this.validator,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final Icon? prefixIcon;
  final Color backgroundColor;
  final double? height;
  final double borderRadius;
  final bool readOnly;
  final bool autofocus;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLine;
  final Function? onClickSuffix;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 10,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        minLines: 1,
        autofocus: autofocus,
        maxLines: maxLine ?? 1,
        validator: validator,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelText: labelText,
            hintText: labelText,
            hintMaxLines: 1,
            errorMaxLines: 2,
            labelStyle: const TextStyle(color: AppColors.mainColorLight, fontSize: 15),
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xffBDBDBD),
            ),
            prefixIcon: prefixIcon,
            prefixIconColor: WidgetStateColor.resolveWith(
              (states) => states.contains(WidgetState.focused)
                  ? AppColors.mainColorLight
                  : Colors.grey,
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: () {
                      if (onClickSuffix != null) {
                        onClickSuffix!();
                      }
                    },
                    icon: suffixIcon!,
                  )
                : null,
            suffixIconColor: Colors.grey,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.mainColorLight, width: 1.5),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            alignLabelWithHint: true),
        // onTapOutside: (event) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}
