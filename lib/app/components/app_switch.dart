import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppSwitch extends StatelessWidget {
  final RxBool isDarkMode;
  final double width;
  final double height;
  final String darkModeIconPath;
  final String lightModeIconPath;
  final Color backgroundDark;
  final Color backgroundLight;
  final Color knobDark;
  final Color knobLight;

  const AppSwitch({
    super.key,
    required this.isDarkMode,
    required this.darkModeIconPath,
    required this.lightModeIconPath,
    this.width = 60,
    this.height = 28,
    required this.backgroundDark,
    required this.backgroundLight,
    required this.knobDark,
    required this.knobLight,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = isDarkMode.value;

      return GestureDetector(
        onTap: () {
          isDarkMode.value = !isDark;
        },
        child: Container(
          width: width.w,
          height: height.h,
          padding: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isDark ? backgroundDark : backgroundLight,
          ),
          child: Stack(
            children: [
              // Show icon of the mode to switch TO
              if (isDark)
                Positioned(
                  left: 6.w,
                  top: 6.h,
                  child: SvgPicture.asset(
                    darkModeIconPath,
                    width: 16.w,
                    height: 16.h,
                  ),
                ),
              if (!isDark)
                Positioned(
                  right: 6.w,
                  top: 6.h,
                  child: SvgPicture.asset(
                    lightModeIconPath,
                    width: 16.w,
                    height: 16.h,
                  ),
                ),

              // The knob
              AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: (height - 8).w,
                  height: (height - 8).h,
                  decoration: BoxDecoration(
                    color: isDark ? knobDark : knobLight,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
