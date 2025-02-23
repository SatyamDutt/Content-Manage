import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle subHeading = TextStyle(
    fontSize: AppDimension.px_16.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle mediumFont = TextStyle(
      fontSize: AppDimension.px_14.sp,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w600);
  static TextStyle smallFont = TextStyle(
    fontSize: AppDimension.px_12.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
  );
  static TextStyle smallFontBlueColor = TextStyle(
    fontSize: AppDimension.px_14.sp,
  );
}
