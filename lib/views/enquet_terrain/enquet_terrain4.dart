import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/widgets/app_button.dart';

class EnquetTerrain4 extends StatefulWidget {
  const EnquetTerrain4({super.key});

  @override
  _EnquetTerrain4State createState() => _EnquetTerrain4State();
}

class _EnquetTerrain4State extends State<EnquetTerrain4> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _frequenceRenouvellementController = TextEditingController();
  final TextEditingController _sourceApprovisionnementController = TextEditingController();
  final TextEditingController _omoDisponibleController = TextEditingController();
  final TextEditingController _texte1Controller = TextEditingController();
  final TextEditingController _texte2Controller = TextEditingController();
  final TextEditingController _texte3Controller = TextEditingController();
  final TextEditingController _texte4Controller = TextEditingController();

  final List<String> _frequenceRenouvellementOptions = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> _sourceApprovisionnementOptions = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> _omoDisponibleOptions = ['Oui', 'Non'];

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
              _buildDropdownField(
                label: 'Fréquence de Renouvellement de Stock',
                value: _frequenceRenouvellementController.text.isEmpty
                    ? null
                    : _frequenceRenouvellementController.text,
                options: _frequenceRenouvellementOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _frequenceRenouvellementController.text = value ?? '';
                  });
                },
                hintText: 'Sélectionnez une option',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Source d\'Approvisionnement',
                value: _sourceApprovisionnementController.text.isEmpty
                    ? null
                    : _sourceApprovisionnementController.text,
                options: _sourceApprovisionnementOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _sourceApprovisionnementController.text = value ?? '';
                  });
                },
                hintText: 'Sélectionnez une option',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Omo est-il Disponible Ici?',
                value: _omoDisponibleController.text.isEmpty
                    ? null
                    : _omoDisponibleController.text,
                options: _omoDisponibleOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _omoDisponibleController.text = value ?? '';
                  });
                },
                hintText: 'Sélectionnez Oui ou Non',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Texte 1',
                controller: _texte1Controller,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un texte';
                  }
                  return null;
                },
                hintText: 'Entrez le texte 1',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Texte 2',
                controller: _texte2Controller,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un texte';
                  }
                  return null;
                },
                hintText: 'Entrez le texte 2',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Texte 3',
                controller: _texte3Controller,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un texte';
                  }
                  return null;
                },
                hintText: 'Entrez le texte 3',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Texte 4',
                controller: _texte4Controller,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un texte';
                  }
                  return null;
                },
                hintText: 'Entrez le texte 4',
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ContinuingButton(
                      width: 361,
                      height: 48,
                      text: 'Continuer',
                      fontSize: 16,
                      borderRadius: 8,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //Navigator.push(
                            //context,
                            //MaterialPageRoute(builder: (context) => const EnquetTerrain4()),
                          //);
                        }
                      },
                    ),
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
