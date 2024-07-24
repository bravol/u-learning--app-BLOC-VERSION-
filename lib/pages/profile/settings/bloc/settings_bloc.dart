import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning_app/pages/profile/settings/bloc/settings_events.dart';
import 'package:u_learning_app/pages/profile/settings/bloc/settings_states.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<TriggerSettingsEvent>(_triggerSettings);
  }

  void _triggerSettings(
      TriggerSettingsEvent event, Emitter<SettingsState> emit) {
    emit(const SettingsState());
  }
}
