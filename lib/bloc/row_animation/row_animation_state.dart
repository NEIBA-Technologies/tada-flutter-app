import 'package:equatable/equatable.dart';

abstract class RowState extends Equatable {
  const RowState();
  
  @override
  List<Object> get props => [];
}

class RowInitial extends RowState {}

class RowActive extends RowState {
  final int index;

  const RowActive({required this.index});

  @override
  List<Object> get props => [index];
}
