import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'form_field_assignment_state.dart';

class FormFieldAssignmentCubit extends Cubit<FormFieldAssignmentState> {
  FormFieldAssignmentCubit() : super(FormFieldAssignmentInitial());
}
