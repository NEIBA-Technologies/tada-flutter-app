part of 'form_field_assignment_cubit.dart';

@immutable
class FormFieldAssignmentState {
  final String? titlePage;
  final List<FormFieldAssignment>? formFields;
  final bool isLoading;

  const FormFieldAssignmentState(
      {this.isLoading = false, this.titlePage, this.formFields});
}

final class FormFieldAssignmentInitial extends FormFieldAssignmentState {
  const FormFieldAssignmentInitial({
    super.titlePage = "",
    super.formFields = const [],
    super.isLoading = true,
  });
}

final class FormFieldAssignmentLoading extends FormFieldAssignmentState {
  FormFieldAssignmentLoading({super.isLoading});
}
