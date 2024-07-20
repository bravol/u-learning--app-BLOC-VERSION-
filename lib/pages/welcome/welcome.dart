import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/pages/home/home.dart';
import 'package:u_learning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_learning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:u_learning_app/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        index: 1,
                        context: context,
                        buttomName: 'Next',
                        name: 'First see Learning',
                        subtitle:
                            'Forget about a for of paper all knowledge in on learning',
                        imagePath: 'assets/images/reading.png',
                      ),
                      _page(
                        index: 2,
                        context: context,
                        buttomName: 'Next',
                        name: 'Connect with everyone',
                        subtitle:
                            'Always keep in touch with your tuitor and lets get connected',
                        imagePath: 'assets/images/boy.png',
                      ),
                      _page(
                        index: 3,
                        context: context,
                        buttomName: 'Get Started',
                        name: 'Always Fascinated Learning',
                        subtitle:
                            'Anyone, anytime, the time is at our description on study whenever you want',
                        imagePath: 'assets/images/man.png',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          size: const Size.square(8.0),
                          activeSize: const Size(18, 8),
                          activeColor: Colors.blue,
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(
      {required index,
      required BuildContext context,
      required String buttomName,
      required String name,
      required String subtitle,
      required String imagePath}) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //0-2 index
            if (index < 3) {
              //aniation
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              //jump to new page
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Home()));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Center(
              child: Text(
                buttomName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
