import 'package:bloc_count_app/app_events.dart';
import 'package:bloc_count_app/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  AppBloc() : super(AppStates(counter: 0)) {
    on<Increament>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
    });
     on<Decreament>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
    });
  }
}
