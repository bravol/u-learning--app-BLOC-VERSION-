import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/pages/sign_in/bloc/signin_events.dart';
import 'package:u_learning_app/pages/sign_in/bloc/signin_states.dart';

class SigninBloc extends Bloc<SignInEvent, SingInState> {
  SigninBloc() : super(const SingInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

//email
  void _emailEvent(EmailEvent event, Emitter<SingInState> emit) {
    emit(state.copyWith(email: event.email));
  }

//password
  void _passwordEvent(PasswordEvent event, Emitter<SingInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
