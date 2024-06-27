import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TacheInfo2 extends StatefulWidget {
  const TacheInfo2({super.key});

  @override
  _TacheInfo2State createState() => _TacheInfo2State();
}

class _TacheInfo2State extends State<TacheInfo2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomCompletController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();
  String? _selectedPaysOrigine;
  String? _selectedLieuHabitation;
  String? _selectedProfession;
  String? _selectedOption;

  final List<String> _paysOrigineOptions = ['France', 'États-Unis', 'Canada', 'Autre'];
  final List<String> _lieuHabitationOptions = ['Paris', 'New York', 'Toronto', 'Autre'];
  final List<String> _professionOptions = ['Ingénieur', 'Médecin', 'Enseignant', 'Autre'];

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required bool obscureText,
    required String? Function(String?) validator,
    required String hintText,
    String? svgImagePath,
    bool isRightIcon = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 10),
        Container(
          width: 361,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: validator,
                ),
              ),
              if (svgImagePath != null && isRightIcon)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    svgImagePath,
                    height: 24,
                    width: 24,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> options,
    required String? Function(String?) validator,
    required void Function(String?) onChanged,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 10),
        Container(
          width: 361,
          height: 44,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadioButton({
    required String label,
    required String value,
    required String? groupValue,
    required void Function(String?) onChanged,
  }) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.black,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                label: 'Nom Complet',
                controller: _nomCompletController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom complet';
                  }
                  return null;
                },
                hintText: 'Entrez votre nom complet',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Photo',
                controller: _photoController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  return null;
                },
                hintText: 'Prenez une photo',
                svgImagePath: 'asset/images/icon/cam_grey_Icon.svg',
                isRightIcon: true,
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Votre Pays d\'Origine (Optionnel)',
                value: _selectedPaysOrigine,
                options: _paysOrigineOptions,
                validator: (value) {
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedPaysOrigine = value;
                  });
                },
                hintText: 'Sélectionnez votre pays d\'origine',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Lieu d\'Habitation (Optionnel)',
                value: _selectedLieuHabitation,
                options: _lieuHabitationOptions,
                validator: (value) {
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedLieuHabitation = value;
                  });
                },
                hintText: 'Sélectionnez votre lieu d\'habitation',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildRadioButton(
                    label: 'Oui',
                    value: 'Oui',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                  ),
                  _buildRadioButton(
                    label: 'Non',
                    value: 'Non',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Quelle est votre profession? (Optionnel)',
                value: _selectedProfession,
                options: _professionOptions,
                validator: (value) {
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedProfession = value;
                  });
                },
                hintText: 'Sélectionnez votre profession',
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    /*ContinuingButton(
                      width: 361,
                      height: 48,
                      text: 'Continuer',
                      fontSize: 16,
                      borderRadius: 8,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TacheInfo3()),
                          );
                        }
                      },
                    ),*/
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
