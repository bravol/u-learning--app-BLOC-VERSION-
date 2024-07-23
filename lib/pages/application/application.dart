import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';
import 'package:u_learning_app/pages/application/application_widgets.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: buildPage(index),
        bottomNavigationBar: Container(
          width: 375.w,
          height: 58.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h))),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryForthElementText,
              currentIndex: index,
              elevation: 0,
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset('assets/icons/home.png'),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/home.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Search',
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/search2.png',
                    ),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/search2.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Course',
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/play-circle1.png',
                    ),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/play-circle1.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Chat',
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/message-circle.png',
                    ),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/message-circle.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/person2.png',
                    ),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/person2.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
              ]),
        ),
      )),
    );
  }
}
