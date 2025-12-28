import 'package:flutter/material.dart';
import 'package:fso/core/constants/colors.dart';

class FSOButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  final bool loading;
  final bool disabled;
  final Color backgroundColor;
  final Color textColor;
  const FSOButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.loading = false,
    this.disabled = false,
    this.backgroundColor = AppColors.kPrimaryColor,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: disabled ? null : onTap,
        borderRadius: BorderRadius.circular(10.0),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          decoration: BoxDecoration(
            color: disabled ? backgroundColor.withOpacity(0.75) : backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: loading
              ? Center(
                  child: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: textColor,
                    ),
                  ),
                )
              : Text(
                  buttonText,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                    color: disabled ? textColor.withOpacity(0.75) : textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
