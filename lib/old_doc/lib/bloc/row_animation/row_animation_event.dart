import 'package:equatable/equatable.dart';

abstract class RowEvent extends Equatable {
  const RowEvent();

  @override
  List<Object> get props => [];
}

class ToggleRow extends RowEvent {
  final int index;

  const ToggleRow({required this.index});

  @override
  List<Object> get props => [index];
}
