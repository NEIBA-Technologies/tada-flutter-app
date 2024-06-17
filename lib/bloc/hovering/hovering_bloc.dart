import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async'; // Importer dart:async pour le Timer
import 'hovering_event.dart';
import 'hovering_state.dart';

class HoveringBloc extends Bloc<HoveringEvent, HoveringState> {
  HoveringBloc() : super(const HoveringState(isClicked: false)) {
    on<HoveringClicked>(_onHoveringClicked);
    on<ResetHovering>(_onResetHovering);
  }

  void _onHoveringClicked(HoveringClicked event, Emitter<HoveringState> emit) {
    emit(const HoveringState(isClicked: true));
    Timer(const Duration(milliseconds: 200), () {
      add(ResetHovering());
    });
  }

  void _onResetHovering(ResetHovering event, Emitter<HoveringState> emit) {
    emit(const HoveringState(isClicked: false));
  }
}
