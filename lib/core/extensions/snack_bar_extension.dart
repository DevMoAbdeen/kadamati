import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../app_widgets/app_text.dart';

extension SnackBarExtensions on BuildContext {
  showSnackBar({
    required String message,
    bool error = false,
    IconData? icon,
    Color? iconColor,
    int secondsDuration = 4,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            icon != null
                ? Icon(icon, color: iconColor ?? Colors.white)
                : error
                    ? Icon(Icons.warning, color: iconColor ?? Colors.white)
                    : Icon(Icons.check_circle, color: iconColor ?? Colors.white),
            Expanded(
              child: AppText(
                text: message,
                fontSize: 14,
                color: Colors.white,
                horizontalPadding: 8,
                maxLines: 6,
              ),
            ),
          ],
        ),
        backgroundColor: error ? AppColors.errorSnackBarColor : AppColors.successSnackBarColor,
        duration: Duration(seconds: secondsDuration),
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  denyDeleteItemSnackBar({
    required String message,
    required Function onClickDeny,
    int secondsDuration = 4,
  }){
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  Expanded(
                    child: AppText(
                      text: message,
                      fontSize: 14,
                      color: Colors.white,
                      horizontalPadding: 8,
                      maxLines: 6,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: onClickDeny(),
              child: const AppText(
                text: "Deny",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                isUnderline: true,
                color: AppColors.mainColorLight,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.errorSnackBarColor ,
        duration: Duration(seconds: secondsDuration),
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
