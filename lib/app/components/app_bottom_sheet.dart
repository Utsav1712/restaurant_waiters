import 'package:flutter/material.dart';

import '../utils/constants/app_colors.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Duration animationDuration;
  final Curve animationCurve;

  const AppBottomSheet({
    super.key,
    required this.child,
    this.backgroundColor = AppColors.white,
    this.borderRadius = 16.0,
    this.padding = const EdgeInsets.all(16.0),
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    Color backgroundColor = AppColors.white,
    double borderRadius = 0.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
    Duration animationDuration = const Duration(milliseconds: 300),
    Curve animationCurve = Curves.easeInOut,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (_) {
        return AnimatedPadding(
          duration: animationDuration,
          curve: animationCurve,
          padding: MediaQuery.of(context).viewInsets,
          child: AppBottomSheet(
            backgroundColor: backgroundColor,
            borderRadius: borderRadius,
            padding: padding,
            animationDuration: animationDuration,
            animationCurve: animationCurve,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: AnimatedContainer(
        duration: animationDuration,
        curve: animationCurve,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: padding,
          child: SafeArea(child: child),
        ),
      ),
    );
  }
}
