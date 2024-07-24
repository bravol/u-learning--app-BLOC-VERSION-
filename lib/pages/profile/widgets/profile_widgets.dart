import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          Text(
            'Profile',
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset('assets/icons/more-vertical.png'),
          ),
        ],
      ),
    ),
  );
}

Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage('assets/icons/headpic.png'),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage(
        'assets/icons/edit_3.png',
      ),
    ),
  );
}

Map<String, String> imagesInfo = {
  'Settings': 'settings.png',
  'Payment details': 'credit-card.png',
  'Love': 'award.png',
};

//setting sections buttons
Widget buildListView() {
  return Column(
    children: imagesInfo.entries.map((entry) {
      return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement),
                child: Image.asset('assets/icons/${entry.value}'),
              ),
              SizedBox(width: 15.w),
              Text(
                entry.key,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.w),
              )
            ],
          ),
        ),
      );
    }).toList(),
  );
}
