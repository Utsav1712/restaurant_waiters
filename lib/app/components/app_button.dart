import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/constants/app_colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final fontWeight;
  final fontFamily;
  final Color? fontColor;
  final Color backgroundColor;

  AppButton({
    this.onTap,
    this.title,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.backgroundColor = AppColors.primary,
    this.fontColor,
    this.fontFamily = "SFProDisplay",
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 7.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 1.8.h),
        ),
        child: Center(
          child: AppText(
            title!,
            color: fontColor ?? AppColors.white,
            fontSize: fontSize ?? 14.sp,
            fontWeight: fontWeight,
            height: 0.0,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}