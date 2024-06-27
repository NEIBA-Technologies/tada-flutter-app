import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TacheInfo3 extends StatefulWidget {
  const TacheInfo3({super.key});

  @override
  _TacheInfo3State createState() => _TacheInfo3State();
}

class _TacheInfo3State extends State<TacheInfo3> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomCompletController = TextEditingController();
  final TextEditingController _etudesSecondairesController = TextEditingController();
  final TextEditingController _experienceProController = TextEditingController();
  
  String? _etudesSuperieuresValue;
  String? _domaineEtudesValue;
  
  final List<String> _etudesSuperieuresOptions = ['Oui', 'Non'];
  final List<String> _domaineEtudesOptions = ['Sciences', 'Lettres', 'Commerce', 'Autre'];

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
              _buildDropdownField(
                label: 'As-tu fait des études supérieures?',
                value: _etudesSuperieuresValue,
                options: _etudesSuperieuresOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez répondre à cette question';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _etudesSuperieuresValue = value;
                  });
                },
                hintText: 'Sélectionnez une option',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Où as-tu fait tes études secondaires?',
                controller: _etudesSecondairesController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le lieu de vos études secondaires';
                  }
                  return null;
                },
                hintText: 'Entrez le lieu de vos études secondaires',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Si oui, dans quel domaine?',
                value: _domaineEtudesValue,
                options: _domaineEtudesOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _domaineEtudesValue = value;
                  });
                },
                hintText: 'Sélectionnez un domaine',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Combien d\'années d\'expérience professionnelles as-tu?',
                controller: _experienceProController,
                keyboardType: TextInputType.number,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer vos années d\'expérience';
                  }
                  return null;
                },
                hintText: 'Entrez vos années d\'expérience',
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
                            MaterialPageRoute(builder: (context) => const TacheInfo4()),
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
