import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    int fontsize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return SizedBox(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontsize.sp,
      ),
    ),
  );
}
