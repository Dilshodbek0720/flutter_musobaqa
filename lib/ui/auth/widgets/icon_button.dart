import 'package:flutter/material.dart';
import 'package:flutter_musobaqa/utils/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({super.key, required this.onTap, required this.icon});
  final VoidCallback onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: AppColors.black.withOpacity(0.7))
      ),
      child: SvgPicture.asset(icon,width: 25.w, height: 25.w),
    );
  }
}