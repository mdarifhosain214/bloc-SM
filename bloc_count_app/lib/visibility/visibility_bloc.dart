import 'package:bloc_count_app/visibility/visibility_state.dart';
import 'package:bloc_count_app/visibility/visibity_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(VisibilityState(isVisible: true)) {
    on<VisibilityShowEvent>((event, emit) => emit(VisibilityState(isVisible: state.isVisible=true)));
    on<VisibilityHideEvent>((event, emit) => emit(VisibilityState(isVisible: state.isVisible=false)));
  }
}
