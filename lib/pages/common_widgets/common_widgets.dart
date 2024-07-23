import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';

AppBar buildAppBar({required String type}) {
  return AppBar(
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0, // defining the thickness of the line
      ),
    ),
    title: Center(
      child: Text(
        type,
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
    actions: [],
  );
}

//we need context for accessing bloc
Widget buildThirdPartyLogIn(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcon('google', () {}),
        _reusableIcon('apple', () {}),
        _reusableIcon('facebook', () {}),
      ],
    ),
  );
}

Widget _reusableIcon(String iconName, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget resusableTextField(
    {required String hintText,
    required String textType,
    required String iconName,
    required void Function(String value)? onChanged}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryForthElementText)),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          width: 16.w,
          height: 16.w,
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 270.w,
          height: 40.h,
          child: TextField(
            onChanged: (value) => onChanged!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
            cursorColor: AppColors.primaryText,
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return SizedBox(
    width: 250.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password',
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget reusableButton(
    {required String buttonName,
    required String buttonType,
    required void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(top: buttonType == 'signin' ? 40.h : 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: buttonType == 'signin'
                ? Colors.transparent
                : AppColors.primaryForthElementText),
        color: buttonType == 'signin'
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == 'signin'
                ? AppColors.primaryBackground
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
