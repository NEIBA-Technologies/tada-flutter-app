import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tada/core/models/assignment.dart';
import 'package:tada/core/models/data_response.dart';
import 'package:tada/core/models/form_field_assignment.dart';
import 'package:tada/core/network/api_provider.dart';

part 'form_field_assignment_state.dart';

class FormFieldAssignmentCubit extends Cubit<FormFieldAssignmentState> {
  FormFieldAssignmentCubit() : super(const FormFieldAssignmentInitial());

  fetchFieldOfType({required MissionType type}) async {
    DataResponse<List<FormFieldAssignment>?> res =
        await ApiProvider().getFieldsForm();
    if (res.data != null) {
      print("res ${res.data?.firstOrNull}");
    }
    emit(const FormFieldAssignmentInitial(
      isLoading: false,
      titlePage: "",
      formFields: [],
    ));
  }
}
