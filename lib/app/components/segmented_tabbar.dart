import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_waiters/app/components/app_text.dart';

import '../utils/constants/app_colors.dart';

class AppSegmentedTabBar extends StatefulWidget {
  final List<String> tabs;
  final int initialIndex;
  final ValueChanged<int> onTabChanged;
  final double height;
  final double width;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final Color selectedTextColor;
  final Color unSelectedTextColor;
  final TextStyle? textStyle;

  const AppSegmentedTabBar({
    super.key,
    required this.tabs,
    required this.onTabChanged,
    this.initialIndex = 0,
    this.height = 45,
    this.width = 220,
    this.selectedColor = AppColors.white,
    this.unselectedColor = AppColors.transparent,
    this.borderColor = AppColors.transparent,
    this.selectedTextColor = AppColors.black,
    this.unSelectedTextColor = AppColors.black,
    this.textStyle,
  });

  @override
  State<AppSegmentedTabBar> createState() => _AppSegmentedTabBarState();
}

class _AppSegmentedTabBarState extends State<AppSegmentedTabBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final tabCount = widget.tabs.length;
    final tabWidth = (widget.width - 8) / tabCount;

    return Container(
      width: widget.width.w,
      height: widget.height.h,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: widget.unselectedColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: widget.borderColor, width: 1),
      ),
      child: Stack(
        children: [
          // Animated background highlight
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment: Alignment(-1 + (2 / (tabCount - 1)) * selectedIndex, 0),
            child: Container(
              width: tabWidth.w,
              height: (widget.height - 8).h,
              decoration: BoxDecoration(
                color: widget.selectedColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Row(
            children: List.generate(widget.tabs.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    widget.onTabChanged(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: AppText(
                      widget.tabs[index],
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: selectedIndex == index ? widget.selectedTextColor : widget.unSelectedTextColor,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
