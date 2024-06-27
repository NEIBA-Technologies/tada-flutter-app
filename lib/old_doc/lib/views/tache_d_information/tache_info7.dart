import 'package:flutter/material.dart';
import 'package:tada/old_doc/lib/widgets/app_button.dart';

class TacheInfo7 extends StatefulWidget {
  const TacheInfo7({super.key});

  @override
  _TacheInfo7State createState() => _TacheInfo7State();
}

class _TacheInfo7State extends State<TacheInfo7> {
  final _formKey = GlobalKey<FormState>();
  
  String? _revenuMensuelValue;
  String? _compteBancaireValue;
  String? _sourceRevenusValue;
  String? _nbSourcesRevenusValue;
  String? _partRevenuAlimentaireValue;
  String? _frequenceAchatsEnLigneValue;

  final List<String> _revenuMensuelOptions = ['< 1000', '1000-3000', '3000-5000', '> 5000'];
  final List<String> _compteBancaireOptions = ['Oui', 'Non'];
  final List<String> _sourceRevenusOptions = ['Salariat', 'Entrepreneuriat', 'Investissement', 'Autre'];
  final List<String> _nbSourcesRevenusOptions = ['1', '2', '3', '4+'];
  final List<String> _partRevenuAlimentaireOptions = ['< 10%', '10-20%', '20-30%', '> 30%'];
  final List<String> _frequenceAchatsEnLigneOptions = ['Jamais', 'Rarement', 'Souvent', 'Très souvent'];

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
                label: 'Quel est le revenu mensuel de ton foyer?',
                value: _revenuMensuelValue,
                options: _revenuMensuelOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _revenuMensuelValue = value;
                  });
                },
                hintText: 'Sélectionnez votre revenu mensuel',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'As-tu un compte bancaire?',
                value: _compteBancaireValue,
                options: _compteBancaireOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _compteBancaireValue = value;
                  });
                },
                hintText: 'Sélectionnez Oui ou Non',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Quelle est ta principale source de revenus?',
                value: _sourceRevenusValue,
                options: _sourceRevenusOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _sourceRevenusValue = value;
                  });
                },
                hintText: 'Sélectionnez votre source de revenus',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Combien de sources de revenus différentes as-tu?',
                value: _nbSourcesRevenusValue,
                options: _nbSourcesRevenusOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _nbSourcesRevenusValue = value;
                  });
                },
                hintText: 'Sélectionnez le nombre de sources de revenus',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Quelle est la part de ton revenu mensuel consacré aux courses alimentaires?',
                value: _partRevenuAlimentaireValue,
                options: _partRevenuAlimentaireOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _partRevenuAlimentaireValue = value;
                  });
                },
                hintText: 'Sélectionnez la part de votre revenu',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'À quelle fréquence fais-tu des achats en ligne?',
                value: _frequenceAchatsEnLigneValue,
                options: _frequenceAchatsEnLigneOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _frequenceAchatsEnLigneValue = value;
                  });
                },
                hintText: 'Sélectionnez la fréquence des achats en ligne',
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
                        // if (_formKey.currentState!.validate()) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => const TacheInfo8()),
                        //   );
                        // }
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
