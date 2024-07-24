import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/pages/profile/widgets/profile_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              profileIconAndEditButton(),
              //prifle butons
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 25.w),
                child: buildListView(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
