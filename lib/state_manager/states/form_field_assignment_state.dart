part of '../blocs/form_field_assignment_bloc.dart';

@immutable
class FormFieldAssignmentState {
  final List<FormFieldAssignment>? formFields;
  final bool isLoading;

  const FormFieldAssignmentState({this.isLoading = false, this.formFields});
}

class FormFieldAssignmentLoaded extends FormFieldAssignmentState {
  FormFieldAssignmentLoaded({
    super.formFields,
    super.isLoading = true,
  });
}

final class FormFieldAssignmentLoading extends FormFieldAssignmentState {
  FormFieldAssignmentLoading({super.isLoading});
}
