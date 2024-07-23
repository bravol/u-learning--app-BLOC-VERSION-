import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/common/widgets/flutter_toast.dart';
import 'package:u_learning_app/pages/sign_in/bloc/signin_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        // or final state = BlocProvider.of<SigninBloc>(context).state;
        final state = context.read<SigninBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //email empty
          print('fill in email');

          toastInfo(
              msg: "You need to fill in your Email Address", context: context);
          return;
        }
        if (password.isEmpty) {
          //passowrd empty
          toastInfo(msg: "You need to fill in your Password", context: context);
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            toastInfo(
              msg: "You do not exist",
            );
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            toastInfo(msg: "You need to verify your email Account");
            return;
          }
          var user = credential.user;
          if (user != null) {
            //got verified user from firebase
            //navigate to home
            print('user exists, true');
          } else {
            //show error getting user from firebase
            toastInfo(msg: "Currently you are not the user of this App");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user_not_found') {
            toastInfo(msg: 'No use found with this email');
            return;
          } else if (e.code == 'wrong_password') {
            toastInfo(msg: 'Incorrect password');
            return;
          } else if (e.code == 'invalid_email') {
            toastInfo(msg: 'Invalid email Address');
            return;
          }
        }
      }
    } catch (e) {}
  }
}
