import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          print('no email');
        }
        if (password.isEmpty) {
          //passowrd empty
          print('no passowrd');
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            print('no user');
          }
          if (!credential.user!.emailVerified) {
            //
            print('not verified');
          }
          var user = credential.user;
          if (user != null) {
            //got verified user from firebase
            //navigate to home
            print('user exists, true');
          } else {
            //show error getting user from firebase
            print('does not exist, false');
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
