part of '../blocs/form_field_assignment_bloc.dart';



@immutable
class FormFieldAssignmentState {
  final String? titlePage;
  final List<FormFieldAssignment>? formFields;
  final bool isLoading;

  const FormFieldAssignmentState(
      {this.isLoading = false, this.titlePage, this.formFields});
}

final class FormFieldAssignmentLoaded extends FormFieldAssignmentState {
  const FormFieldAssignmentLoaded({
    super.titlePage = "",
    super.formFields = const [],
    super.isLoading = true,
  });
}

final class FormFieldAssignmentLoading extends FormFieldAssignmentState {
  FormFieldAssignmentLoading({super.isLoading});
}

