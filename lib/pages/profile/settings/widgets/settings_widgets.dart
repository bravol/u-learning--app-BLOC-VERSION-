import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Center( 
      child: Container(
        child: Text(
          'Settings',
          style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
        ),
      ),
    ),
  );
}
