import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/pages/home/bloc/home_events.dart';
import 'package:u_learning_app/pages/home/bloc/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    //register events
    on<HomeEvent>((event, emit) {
      emit(HomeState(page2: state.page2));
    });
  }
}
