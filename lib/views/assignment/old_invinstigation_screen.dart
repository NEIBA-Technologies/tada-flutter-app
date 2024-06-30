import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/app_form_field.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/extensions.dart';


class ComponentsBuilde extends StatelessWidget {
  ComponentsBuilde({super.key});

  final TextEditingController _time1Controller = TextEditingController();
  final TextEditingController _time2Controller = TextEditingController();
  final TextEditingController _storeTypeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _entryPhotoController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Heure de vente',
              style: context.labelSmall.copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Expanded(
                  child: AppFormField(
                    label: '',
                    controller: _time1Controller,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppFormField(
                    label: '',
                    controller: _time2Controller,
                  ),
                ),
              ],
            ),
            const SpaceHeightCustom(breakPoint: BreakPoint.xs),
            // Row with two radio buttons for gender selection
            Text(
              'Quel est votre genre?',
              style: context.labelSmall.copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Homme'),
                    leading: Radio<String>(
                      value: 'Homme',
                      groupValue: _selectedGender,
                      onChanged: (String? value) {
                        _selectedGender = value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Femme'),
                    leading: Radio<String>(
                      value: 'Femme',
                      groupValue: _selectedGender,
                      onChanged: (String? value) {
                        _selectedGender = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
