import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogIn(context),
                Center(
                    child: reusableText('Or Use your email Account to login')),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Email'),
                      SizedBox(height: 5.h),
                      resusableTextField('Enter your email', 'email', 'user'),
                      reusableText('Password'),
                      SizedBox(height: 5.h),
                      resusableTextField(
                        'Enter your password',
                        'password',
                        'lock',
                      ),
                      forgotPassword(),
                      //buttons
                      reusableButton('Sign In', 'signin'),
                      reusableButton('Register', 'register'),
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
