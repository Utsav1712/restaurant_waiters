import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_waiters/app/utils/constants/app_colors.dart';
import '../../../components/app_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText(
          "Home Page",
          fontSize: 22.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
