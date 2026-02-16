import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants/app_colors.dart';
import 'app_text.dart';

class NoDataFound extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double imageHeight;
  final EdgeInsetsGeometry padding;
  final MainAxisAlignment alignment;
  final fontFamily;
  final double? titleFontSize;
  final titleFontWeight;
  final Color? titleFontColor;
  final double? subTitleFontSize;
  final subTitleFontWeight;
  final Color? subTitleFontColor;

  const NoDataFound({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.imageHeight = 150,
    this.padding = const EdgeInsets.all(16),
    this.alignment = MainAxisAlignment.center,
    this.titleFontColor,
    this.fontFamily = "SFProDisplay",
    this.titleFontSize,
    this.titleFontWeight = FontWeight.w400,
    this.subTitleFontColor,
    this.subTitleFontSize,
    this.subTitleFontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: alignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            height: imageHeight,
          ),
          SizedBox(height: 30.h),
          AppText(
            title,
            textAlign: TextAlign.center,
            color: titleFontColor ?? AppColors.white,
            fontSize: titleFontSize ?? 22.sp,
            fontWeight: titleFontWeight ?? FontWeight.w600,
            height: 0.0,
            fontFamily: fontFamily,
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppText(
              subtitle,
              textAlign: TextAlign.center,
              color: subTitleFontColor ?? AppColors.subtitle,
              fontSize: subTitleFontSize ?? 16.sp,
              fontWeight: subTitleFontWeight ,
              height: 1.3,
              fontFamily: fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
