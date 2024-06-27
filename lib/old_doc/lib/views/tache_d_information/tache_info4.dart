import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TacheInfo4 extends StatefulWidget {
  const TacheInfo4({super.key});

  @override
  _TacheInfo4State createState() => _TacheInfo4State();
}

class _TacheInfo4State extends State<TacheInfo4> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _posteActuelController = TextEditingController();
  
  String? _secteurTravailValue;
  String? _situationMatrimonialeValue;
  String? _enfantsValue;
  String? _sportValue;
  String? _croyanceValue;
  
  final List<String> _secteurTravailOptions = ['Finance', 'Technologie', 'Santé', 'Éducation', 'Autre'];
  final List<String> _situationMatrimonialeOptions = ['Célibataire', 'Marié(e)', 'Divorcé(e)', 'Veuf/Veuve'];
  final List<String> _enfantsOptions = ['Aucun', '1', '2', '3', 'Plus de 3'];
  final List<String> _sportOptions = ['Oui', 'Non'];
  final List<String> _croyanceOptions = ['Oui', 'Non'];

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
                label: 'Dans quel secteur travailles-tu?',
                value: _secteurTravailValue,
                options: _secteurTravailOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _secteurTravailValue = value;
                  });
                },
                hintText: 'Sélectionnez votre secteur de travail',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Quel est ton poste actuel?',
                controller: _posteActuelController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre poste actuel';
                  }
                  return null;
                },
                hintText: 'Entrez votre poste actuel',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Quelle est ta situation matrimoniale?',
                value: _situationMatrimonialeValue,
                options: _situationMatrimonialeOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _situationMatrimonialeValue = value;
                  });
                },
                hintText: 'Sélectionnez votre situation matrimoniale',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'As-tu des enfants? Si oui, combien?',
                value: _enfantsValue,
                options: _enfantsOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _enfantsValue = value;
                  });
                },
                hintText: 'Sélectionnez le nombre d\'enfants',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Pratiques-tu un sport ou une activité physique régulière?',
                value: _sportValue,
                options: _sportOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _sportValue = value;
                  });
                },
                hintText: 'Sélectionnez Oui ou Non',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'As-tu des croyances religieuses ou spirituelles?',
                value: _croyanceValue,
                options: _croyanceOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _croyanceValue = value;
                  });
                },
                hintText: 'Sélectionnez Oui ou Non',
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                   /* ContinuingButton(
                      width: 361,
                      height: 48,
                      text: 'Continuer',
                      fontSize: 16,
                      borderRadius: 8,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TacheInfo5()),
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
