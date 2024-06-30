part of '../blocs/form_field_assignment_bloc.dart';

@immutable
class FormFieldAssignmentState {
  const FormFieldAssignmentState();
}


class FormFieldAssignmentInital extends FormFieldAssignmentState {}

class FormFieldAssignmentLoaded extends FormFieldAssignmentState {
  final List<FormFieldAssignment> formFields;

  FormFieldAssignmentLoaded({required this.formFields});
}

final class FormFieldAssignmentLoading extends FormFieldAssignmentState {}
