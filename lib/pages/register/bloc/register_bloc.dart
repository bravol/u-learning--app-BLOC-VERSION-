import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/pages/register/bloc/register_events.dart';
import 'package:u_learning_app/pages/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

//username
  void _usernameEvent(UsernameEvent event, Emitter<RegisterStates> emit) {
    // print('username: ${event.username}');
    emit(state.copyWith(username: event.username));
  }

  //email
  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    // print('email ${event.email}');
    emit(state.copyWith(email: event.email));
  }

  //password
  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    // print('password ${state.password}');
    emit(state.copyWith(password: event.password));
  }

  //confirm password
  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<RegisterStates> emit) {
    // print('confirm ${event.confirmPassword}');
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
