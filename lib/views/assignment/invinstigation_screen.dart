import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/components/others_widget/app_form_field.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/models/form_field_assignment.dart';
import 'package:tada/core/shared/modals.dart';
import 'package:tada/state_manager/blocs/form_field_assignment_bloc.dart';

import '../../components/others_widget/app_buttom_widget.dart';
import '../../components/others_widget/calendar_input.dart';
import '../../components/others_widget/datetime_start_end_input.dart';
import '../../components/others_widget/dropdwon_input.dart';
import '../../components/others_widget/map_with_preview.dart';
import '../../components/others_widget/radio_widget.dart';
import '../../components/others_widget/tag_input.dart';
import '../../components/others_widget/upload_input.dart';
import '../../core/constants.dart';
import '../../core/models/assignment.dart';

class InvinstigationScreen extends StatefulWidget {
  InvinstigationScreen({super.key, required this.data});

  Assignment? data;

  @override
  State<InvinstigationScreen> createState() => _InvinstigationScreenState();
}

class _InvinstigationScreenState extends State<InvinstigationScreen> {
  int initialPage = 0;
  late PageController _controllerPageView;

  bool isLoading = false;

  String? titlePage = "";

  List<FormFieldAssignment> formFields = [];

  Map<String, List<FormFieldAssignment>> stepsForm = {};

  Map<String, GlobalKey> formKeys = {};

  Map<String, TextEditingController> controllerFields = {};

  bool get hasNextStep => initialPage < stepsForm.keys.length - 1;

  bool get hasPreviewStep => initialPage > 0;

  @override
  void initState() {
    _controllerPageView = PageController(initialPage: initialPage);
    titlePage = widget.data?.title;
    BlocProvider.of<FormFieldAssignmentBloc>(context).add(
        FetchFormFieldAssignmentEvent(
            type: this.widget.data?.type ?? MissionType.spontaneous));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormFieldAssignmentBloc, FormFieldAssignmentState>(
      listener: (context, state) {
        setState(() {
          isLoading = state is FormFieldAssignmentLoading;
        });
        if (state is FormFieldAssignmentLoaded) {
          if (kDebugMode) {
            print("state.formFields ${state.formFields.length}");
          }
          formFields = state.formFields;
          stepsForm = formFields.groupByStep();
          stepsForm.keys.map((step) {
            formKeys[step] = GlobalKey();
          });
          formFields.map((it) {
            controllerFields[keyFormatController(it)] = TextEditingController();
          });
          if (kDebugMode) {
            print("stepsForm ${stepsForm.length}");
          }
          setState(() {});
        }
      },
      child: WillPopScope(
        onWillPop: () async => await Modals.showAlertClose(context) ?? false,
        child: ScaffoldPage(
          titlePage: '${widget.data?.title}',
          color: Colors.white,
          canBack: initialPage != 0,
          backIcon: IconButton(
            onPressed: () {
              if (hasPreviewStep) {
                setState(() {
                  initialPage--;
                });
                navigationTo(initialPage);
              }
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          actions: [const CloseButton()],
          bottomsheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButtonWidget(
              onPressed: () {
                if (hasNextStep) {
                  setState(() {
                    initialPage++;
                  });
                  navigationTo(initialPage);
                } else {}
              },
              label: initialPage == 0
                  ? "Commencer"
                  : hasNextStep
                      ? "Suivant"
                      : "Terminer",
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              controller: _controllerPageView,
              children: stepsForm.keys.map(
                (step) {
                  return Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKeys[step],
                    child: ListView.separated(
                      padding: EdgeInsets.all(padding),
                      physics: const ClampingScrollPhysics(),
                      itemCount: stepsForm[step]!.length,
                      separatorBuilder: (context, index) =>
                          const SpaceHeightCustom(),
                      itemBuilder: (context, index) {
                        final item = stepsForm[step]![index];
                        return FormFieldGenerate(
                            data: item,
                            stepsFormIndex: initialPage,
                            indexField: index,
                            controller:
                                controllerFields[keyFormatController(item)]);
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }

  void navigationTo(int page) {
    _controllerPageView.animateToPage(
      page,
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
    );
  }

  Widget FormFieldGenerate({
    required FormFieldAssignment data,
    required int stepsFormIndex,
    required int indexField,
    TextEditingController? controller,
  }) {
    switch (data.type?.toEnumTypeFormField()) {
      case TypeFormFieldAssignment.TEXT:
        return AppFormField(
          label: data.label!,
          labelHint: data.hint,
          labelBold: true,
          controller: controller,
          maxLines: 1,
        );
      case TypeFormFieldAssignment.COVER:
        return UploadInput(
          onChanged: (value) {},
          data: data,
        );
      case TypeFormFieldAssignment.DROPDWON:
        return DropdwonInput(
          data: data,
          controller: controller ?? TextEditingController(),
        );
      case TypeFormFieldAssignment.MAP:
      case TypeFormFieldAssignment.MAP_WITH_PREVIEW:
        return MapWithPreview(
          data: data,
          controller: TextEditingController(),
        );
      case TypeFormFieldAssignment.DATE_TIME:
        return CalendarInput(
          data: data,
          controller: controller ?? TextEditingController(),
          onChanged: (value) {
            // controller?.text = value.hummanShort();
          },
        );
      case TypeFormFieldAssignment.RADIO:
        return RadioInput(
          data: data,
          selected: "Homme",
          onChanged: (String? value) {
            // controller?.text = value ?? '';
          },
        );
      case TypeFormFieldAssignment.PHONE:
        return AppFormField(
          label: data.label!,
          labelHint: data.hint,
          labelBold: true,
          controller: controller,
          maxLines: 1,
          keyboard: TextInputType.phone,
        );
      case TypeFormFieldAssignment.NUMERIC:
        return AppFormField(
          label: data.label!,
          labelHint: data.hint,
          labelBold: true,
          controller: controller,
          maxLines: 1,
          keyboard: TextInputType.number,

        );
      case TypeFormFieldAssignment.TEXT_AREA:
        return AppFormField(
          label: data.label!,
          labelHint: data.hint,
          labelBold: true,
          controller: controller,
          maxLines: 4,
        );
      case TypeFormFieldAssignment.DATE_TIME_START_END:
        return DatetimeStartEndInput(
          data: data,
          onChanged: (DateTime value) {},
          controller: controller ?? TextEditingController(),
        );
      case TypeFormFieldAssignment.TAG:
        return TagInput(
          data: data,
          controller: TextEditingController(),
        );
      default:
        return AppFormField(
          label: data.label!,
          labelHint: data.hint,
          labelBold: true,
          controller: controller,
          maxLines: 1,
        );
    }
  }

  String keyFormatController(FormFieldAssignment it) =>
      "${it.step}|${it.order}";
}
