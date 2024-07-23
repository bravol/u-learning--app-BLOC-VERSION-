// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/common/widgets/flutter_toast.dart';
import 'package:u_learning_app/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  RegisterController({required this.context});

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (username.isEmpty) {
      toastInfo(msg: 'Username cannot be empty');
    } else if (email.isEmpty) {
      toastInfo(msg: 'Email cannot be empty');
    } else if (password.isEmpty) {
      toastInfo(msg: 'Password cannot be empty');
    } else if (confirmPassword.isEmpty) {
      toastInfo(msg: 'Confirm Password cannot be empty');
    }

    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credentials.user != null) {
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(username);
        toastInfo(
          msg:
              'Email has been sent to your registered Email, To activate it, Please check your email box and click on the link',
        );
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'Password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'Email already in use');
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: 'Invalid email format');
      }
    }
  }
}
