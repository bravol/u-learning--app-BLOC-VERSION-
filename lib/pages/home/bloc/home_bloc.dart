import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/pages/home/bloc/home_events.dart';
import 'package:u_learning_app/pages/home/bloc/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    //body
    on<HomeDotEvent>(_homeDots);
  }

  void _homeDots(HomeDotEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
