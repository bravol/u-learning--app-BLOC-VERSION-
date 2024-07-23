import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/pages/common_widgets/common_widgets.dart';
import 'package:u_learning_app/pages/register/bloc/register_bloc.dart';
import 'package:u_learning_app/pages/register/bloc/register_events.dart';
import 'package:u_learning_app/pages/register/bloc/register_states.dart';
import 'package:u_learning_app/pages/register/register_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
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
                              onChanged: (value) {
                                context
                                    .read<RegisterBloc>()
                                    .add(UsernameEvent(value));
                              }),
                          reusableText('Email'),
                          resusableTextField(
                              hintText: 'Enter your email',
                              textType: 'email',
                              iconName: 'user',
                              onChanged: (value) {
                                context
                                    .read<RegisterBloc>()
                                    .add(EmailEvent(value));
                              }),
                          reusableText('Password'),
                          resusableTextField(
                              hintText: 'Enter your password',
                              textType: 'password',
                              iconName: 'lock',
                              onChanged: (value) {
                                context
                                    .read<RegisterBloc>()
                                    .add(PasswordEvent(value));
                              }),
                          reusableText('Confirm Password'),
                          resusableTextField(
                              hintText: 'Re-enter your password',
                              textType: 'password',
                              iconName: 'lock',
                              onChanged: (value) {
                                context
                                    .read<RegisterBloc>()
                                    .add(ConfirmPasswordEvent(value));
                              }),
                          reusableText(
                              'By Creating an account, you have to agree with our terms and conditons'),
                          reusableButton(
                            buttonName: ' Sign Up',
                            buttonType: 'signin',
                            onTap: () {
                              RegisterController(context: context)
                                  .handleEmailRegister();
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
      },
    );
  }
}
