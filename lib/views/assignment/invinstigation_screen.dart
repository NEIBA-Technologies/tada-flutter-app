import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/core/models/form_field_assignment.dart';
import 'package:tada/state_manager/blocs/form_field_assignment_bloc.dart';

import '../../components/others_widget/app_buttom_widget.dart';
import '../../core/models/assignment.dart';

class InvinstigationScreen extends StatefulWidget {
  InvinstigationScreen({super.key, required this.data});

  Assignment? data;

  @override
  State<InvinstigationScreen> createState() => _InvinstigationScreenState();
}

class _InvinstigationScreenState extends State<InvinstigationScreen> {
  final PageController _controllerPageView = PageController(initialPage: 0);

  bool isLoading = false;

  String? titlePage = "";

  List<FormFieldAssignment> formFields = [];

  @override
  void initState() {
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
          isLoading = state.isLoading;
        });
        if (state is FormFieldAssignmentLoaded) {
          formFields = state.formFields ?? [];
          titlePage ??= state.titlePage;

          print("formFields ${formFields.length}");
        }
      },
      child: ScaffoldPage(
        titlePage: '${widget.data?.title}',
        color: Colors.white,
        canBack: true,
        bottomsheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppButtonWidget(onPressed: () {}, label: "Commencer"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: PageView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: _controllerPageView,
            children: const [Center(child: Text("data"))],
          ),
        ),
      ),
    );
  }

  void navigationTo(int page) {
    _controllerPageView.animateToPage(
      page,
      duration: const Duration(seconds: 1),
      curve: Curves.bounceInOut,
    );
  }
}
