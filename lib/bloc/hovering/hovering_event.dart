import 'package:equatable/equatable.dart';

abstract class HoveringEvent extends Equatable {
  const HoveringEvent();

  @override
  List<Object> get props => [];
}

class HoveringClicked extends HoveringEvent {}
class ResetHovering extends HoveringEvent {}
