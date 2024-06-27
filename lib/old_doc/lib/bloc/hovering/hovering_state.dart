import 'package:equatable/equatable.dart';

class HoveringState extends Equatable {
  final bool isClicked;

  const HoveringState({required this.isClicked});

  @override
  List<Object> get props => [isClicked];
}
