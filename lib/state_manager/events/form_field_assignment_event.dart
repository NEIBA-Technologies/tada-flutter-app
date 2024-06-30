part of '../blocs/form_field_assignment_bloc.dart';

@immutable
sealed class FormFieldAssignmentEvent {}

class FetchFormFieldAssignmentEvent extends FormFieldAssignmentEvent {
  final MissionType type;

  FetchFormFieldAssignmentEvent({required this.type});
}
