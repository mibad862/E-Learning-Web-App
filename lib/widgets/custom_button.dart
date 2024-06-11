import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, // Corrected key definition
    required this.onPressed,
    this.height,
    this.width,
    required this.text,
    this.textColor,
    this.buttonColor,
    this.fontSize,
    this.borderRadius,
    this.buttonElevation,
    this.borderColor,
    this.svgAsset,
    this.fontFamily,
    this.fontWeight,
  }); // Corrected super constructor call

  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final double? buttonElevation;
  final Color? borderColor;
  final String? svgAsset;
  final String? fontFamily;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: buttonElevation ?? 0.0,
      borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
      color: Colors.transparent, // Set color to transparent
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
        onTap: onPressed,
        child: Container(
          height: height ?? 20,
          width: width ?? 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.blue),
            borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
            color: buttonColor ?? Colors.blue,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: fontSize ?? 15,
              color: textColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontFamily: fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
