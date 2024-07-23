import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/pages/common_widgets/common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(type: 'Sign Up'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                    child: reusableText(
                        'Enter your Details below and free sign up')),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Username'),
                      resusableTextField(
                          hintText: 'Enter your username',
                          textType: 'name',
                          iconName: 'user',
                          onChanged: (value) {}),
                      reusableText('Email'),
                      resusableTextField(
                          hintText: 'Enter your email',
                          textType: 'email',
                          iconName: 'user',
                          onChanged: (value) {}),
                      reusableText('Password'),
                      resusableTextField(
                          hintText: 'Enter your password',
                          textType: 'password',
                          iconName: 'lock',
                          onChanged: (value) {}),
                      reusableText('Confirm Password'),
                      resusableTextField(
                          hintText: 'Re-enter your password',
                          textType: 'password',
                          iconName: 'lock',
                          onChanged: (value) {}),
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: reusableText(
                            'Enter your Details below and free sign up'),
                      ),
                      reusableButton(
                        buttonName: ' Sign Up',
                        buttonType: 'signin',
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
