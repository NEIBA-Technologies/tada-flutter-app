import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tada/bloc/row_animation/row_animation_event.dart';
import 'package:tada/bloc/row_animation/row_animation_state.dart';


class RowBloc extends Bloc<RowEvent, RowState> {
  RowBloc() : super(RowInitial()) {
    on<ToggleRow>((event, emit) {
      if (state is RowActive && (state as RowActive).index == event.index) {
        emit(RowInitial());
      } else {
        emit(RowActive(index: event.index));
      }
    });
  }
}
