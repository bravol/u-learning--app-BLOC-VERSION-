import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/values/colors.dart';
import 'package:u_learning_app/pages/bloc_providers.dart';
import 'package:u_learning_app/pages/home/home.dart';
import 'package:u_learning_app/pages/register/register.dart';
import 'package:u_learning_app/pages/sign_in/sign_in.dart';
import 'package:u_learning_app/pages/welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          home: const Welcome(),
          routes: {
            '/home-page': (context) => const Home(),
            '/sign-in': (context) => const SignIn(),
            '/register': (context) => const Register(),
          },
        ),
      ),
    );
  }
}
