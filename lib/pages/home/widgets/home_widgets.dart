import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';
import 'package:u_learning_app/pages/home/bloc/home_bloc.dart';
import 'package:u_learning_app/pages/home/bloc/home_events.dart';
import 'package:u_learning_app/pages/home/bloc/home_states.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/person.png'))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

//reusable search
Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.h,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryForthElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Search Your course",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: TextStyle(
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
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

Widget _slidersContainer({required String imagePath}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.h)),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(imagePath),
      ),
    ),
  );
}

Widget slidersView(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBloc>().add(HomeDotEvent(value));
          },
          children: [
            _slidersContainer(imagePath: 'assets/icons/Art.png'),
            _slidersContainer(imagePath: 'assets/icons/Image(1).png'),
            _slidersContainer(imagePath: 'assets/icons/Image(2).png'),
          ],
        ),
      ),
      SizedBox(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      )
    ],
  );
}

//menu view
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableText('Choose your course'),
            GestureDetector(
              onTap: () {},
              child: _reusableText('See all',
                  color: AppColors.primaryThirdElementText, fontsize: 10),
            ),
          ],
        ),
      ),

      //buttons
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusableMenuButtonText('All'),
            _reusableMenuButtonText('Popular',
                textColor: AppColors.primaryThirdElementText,
                bgColor: Colors.white),
            _reusableMenuButtonText('Newest',
                textColor: AppColors.primaryThirdElementText,
                bgColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

Widget _reusableText(String text,
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

Widget _reusableMenuButtonText(String text,
    {Color bgColor = AppColors.primaryElement,
    Color textColor = AppColors.primaryElementText}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 15.w),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: bgColor),
    ),
    child: _reusableText(
      text,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontsize: 9,
    ),
  );
}
