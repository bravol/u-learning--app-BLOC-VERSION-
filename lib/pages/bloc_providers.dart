import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/pages/home/bloc/home_bloc.dart';
import 'package:u_learning_app/pages/register/bloc/register_bloc.dart';
import 'package:u_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:u_learning_app/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(lazy: false, create: (context) => HomeBloc()),
        BlocProvider(create: (context) => SigninBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
//lazy: false, //create as soon as possible