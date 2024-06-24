import 'package:flutter/material.dart';
import 'package:tada/components/app_buttom_widget.dart';
import 'package:tada/components/header_modal.dart';
import 'package:tada/components/layout_modal.dart';
import 'package:tada/core/constants.dart';

import '../../components/formfield.dart';
import 'modals.dart';

class DemandeMesse extends StatefulWidget {
  final String time;
  final String hour;
  final dynamic data;

  const DemandeMesse({
    super.key,
    required this.time,
    required this.hour,
    required this.data,
  });

  @override
  State<DemandeMesse> createState() => _DemandeMesseState();
}

class _DemandeMesseState extends State<DemandeMesse> {
  Map<String, dynamic>? selectedIntentionCategory;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutModal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderModal(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.church,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Text(
                  "${widget.data['eglise']}",
                  style: TextStyle(
                    color: yellowColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${widget.data['adresse']}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(padding * 2),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        widget.time,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        widget.hour,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xff192622)),
                      ),
                      SizedBox(height: padding * 2),
                      Form(
                          child: Column(
                        children: [
                          Formfield(
                            labelText: "Qui demande la messe",
                            hintText: 'Qui demande la messe',
                          ),
                          SizedBox(
                            height: padding * 2,
                          ),
                          DropdownButtonFormField<Map<String, dynamic>>(
                              decoration: InputDecoration(
                                floatingLabelStyle:
                                    TextStyle(color: greenColor, fontSize: 14),
                                labelStyle: TextStyle(
                                  color: greenColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                labelText: 'Choisissez une intention',
                                border: const OutlineInputBorder(),
                              ),
                              value: selectedIntentionCategory,
                              items: intentionCategories
                                  .map((Map<String, dynamic> value) {
                                return DropdownMenuItem<Map<String, dynamic>>(
                                  value: value,
                                  child: Text(
                                    value['value'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: blackColor,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (Map<String, dynamic>? newValue) {
                                setState(() {
                                  selectedIntentionCategory = newValue;
                                });
                              }),
                          SizedBox(
                            height: padding * 2,
                          ),
                          Formfield(
                            labelText: "Par l’intercession de",
                            hintText: 'Par l’intercession de',
                          ),
                          SizedBox(
                            height: padding * 2,
                          ),
                          Formfield(
                            maxline: 4,
                            labelText: "Motif de l’Intention",
                            hintText: 'Pour...',
                          ),
                          SizedBox(
                            height: padding * 2,
                          ),
                          AppButtonWidget(
                              press: () async {
                                Navigator.pop(context);
                                Modals.showModalChoiceOffering(context);
                              },
                              label: "Envoyer la demande de messe")
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
