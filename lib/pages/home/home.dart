import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';
import 'package:u_learning_app/pages/home/widgets/home_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText(
              'Hello',
              color: AppColors.primaryThirdElementText,
            ),
            homePageText('Lumala Brian', top: 5),
          ],
        ),
      ),
    );
  }
}
