import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tada/core/models/assignment.dart';

import '../../core/models/data_response.dart';
import '../../core/models/form_field_assignment.dart';
import '../../core/network/api_provider.dart';

part '../events/form_field_assignment_event.dart';
part '../states/form_field_assignment_state.dart';

class FormFieldAssignmentBloc
    extends Bloc<FormFieldAssignmentEvent, FormFieldAssignmentState> {
  FormFieldAssignmentBloc() : super(FormFieldAssignmentLoaded()) {
    on<FetchFormFieldAssignmentEvent>(fetchFormFieldAssignment);
  }

  Future<FutureOr<void>> fetchFormFieldAssignment(
      FetchFormFieldAssignmentEvent event,
      Emitter<FormFieldAssignmentState> emit) async {
    try {
      if (kDebugMode) {
        print('event ${event.type.name}');
      }
      DataResponse<List<dynamic>?> res = await ApiProvider().getFieldsForm();
      List<FormFieldAssignment> formFields = [];
      if (res.data != null) {
        formFields = (res.data ?? [])
            .map((e) => FormFieldAssignment.fromMap(e))
            .toList();
        emit(FormFieldAssignmentLoaded(
            isLoading: false, formFields: formFields));

      } else {
        emit(FormFieldAssignmentLoaded(isLoading: false, formFields: []));
      }
    } catch (e) {
      emit(
        FormFieldAssignmentLoaded(
          isLoading: false,
          formFields: [],
        ),
      );
    }
  }
}
