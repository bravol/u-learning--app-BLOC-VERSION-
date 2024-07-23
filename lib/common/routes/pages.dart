// ignore_for_file: public_member_api_docs, sort_constructors_first
//unify blocProvider and routes and pages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/common/routes/names.dart';
import 'package:u_learning_app/pages/application/application.dart';
import 'package:u_learning_app/pages/register/bloc/register_bloc.dart';
import 'package:u_learning_app/pages/register/register.dart';
import 'package:u_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:u_learning_app/pages/sign_in/sign_in.dart';
import 'package:u_learning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:u_learning_app/pages/welcome/welcome.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SigninBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const Application(),
        // bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
    ];
  }

//return all the bloc providers
  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var page in routes()) {
      if (page.bloc != null) {
        blocProviders.add(page.bloc);
      }
    }
    return blocProviders;
  }

  //generate route
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result =
          routes().where((element) => element.route == settings.name).first;

      return MaterialPageRoute(builder: (_) => result.page, settings: settings);
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}
