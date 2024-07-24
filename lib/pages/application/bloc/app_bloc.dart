import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/pages/application/bloc/app_events.dart';
import 'package:u_learning_app/pages/application/bloc/app_states.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}
