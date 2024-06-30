import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/models/assignment.dart';

import '../../core/models/data_response.dart';
import '../../core/models/form_field_assignment.dart';
import '../../core/network/api_provider.dart';

part '../events/form_field_assignment_event.dart';
part '../states/form_field_assignment_state.dart';

class FormFieldAssignmentBloc
    extends Bloc<FormFieldAssignmentEvent, FormFieldAssignmentState> {
  FormFieldAssignmentBloc() : super(FormFieldAssignmentInital()) {
    on<FetchFormFieldAssignmentEvent>(fetchFormFieldAssignment);
  }

  Future<FutureOr<void>> fetchFormFieldAssignment(
      FetchFormFieldAssignmentEvent event,
      Emitter<FormFieldAssignmentState> emit) async {
    try {
      emit(FormFieldAssignmentLoading());
      if (kDebugMode) {
        print('event ${event.type.name}');
      }
      DataResponse<List<dynamic>?> res = await ApiProvider().getFieldsForm();
      if (res.data != null) {
        List<FormFieldAssignment> dataFormat = (res.data ?? [])
            .map((e) => FormFieldAssignment.fromMap(e))
            .where((element) => element.isInputOf(event.type.name))
            .toList();

        dataFormat = dataFormat.sortListByStep();
        emit(FormFieldAssignmentLoaded(formFields: dataFormat));
      } else {
        emit(FormFieldAssignmentLoaded(formFields: []));
      }
    } catch (e) {
      emit(
        FormFieldAssignmentLoaded(formFields: []),
      );
    }
  }
}
