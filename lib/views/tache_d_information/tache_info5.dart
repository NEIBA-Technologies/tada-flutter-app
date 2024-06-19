import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/tache_d_information/tache_info6.dart';
import 'package:tada/widgets/app_button.dart';

class TacheInfo5 extends StatefulWidget {
  const TacheInfo5({super.key});

  @override
  _TacheInfo5State createState() => _TacheInfo5State();
}

class _TacheInfo5State extends State<TacheInfo5> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _paysInspirationController = TextEditingController();
  final TextEditingController _ordinateurController = TextEditingController();
  final TextEditingController _platPrefereController = TextEditingController();
  
  String? _voyageValue;
  String? _reseauxSociauxValue;
  
  final List<String> _voyageOptions = ['Oui', 'Non'];
  final List<String> _reseauxSociauxOptions = ['Facebook', 'Instagram', 'Twitter', 'LinkedIn', 'Autre'];

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
                label: 'As-tu voyagé dans d\'autres pays?',
                value: _voyageValue,
                options: _voyageOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _voyageValue = value;
                  });
                },
                hintText: 'Sélectionnez Oui ou Non',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Si oui, lesquels?',
                controller: _paysInspirationController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (_voyageValue == 'Oui' && (value == null || value.isEmpty)) {
                    return 'Veuillez entrer les pays visités';
                  }
                  return null;
                },
                hintText: 'Entrez les pays visités',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Es-tu actif sur les réseaux sociaux? si oui lesquels',
                value: _reseauxSociauxValue,
                options: _reseauxSociauxOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _reseauxSociauxValue = value;
                  });
                },
                hintText: 'Sélectionnez vos réseaux sociaux',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'As-tu un ordinateur? Si oui quel marque?',
                controller: _ordinateurController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (_reseauxSociauxValue == 'Oui' && (value == null || value.isEmpty)) {
                    return 'Veuillez entrer les réseaux sociaux utilisés';
                  }
                  return null;
                },
                hintText: 'Entrez les réseaux sociaux utilisés',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Quel est ton plat préféré?',
                controller: _platPrefereController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre plat préféré';
                  }
                  return null;
                },
                hintText: 'Entrez votre plat préféré',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TacheInfo6()),
                          );
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
