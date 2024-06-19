import 'package:flutter/material.dart';
import 'package:tada/views/tache_d_information/tache_info9.dart';
import 'package:tada/widgets/app_button.dart';

class TacheInfo8 extends StatefulWidget {
  const TacheInfo8({super.key});

  @override
  _TacheInfo8State createState() => _TacheInfo8State();
}

class _TacheInfo8State extends State<TacheInfo8> {
  final _formKey = GlobalKey<FormState>();

  String? _typeMagasinValue;
  String? _marqueProduitsValue;
  String? _typeProduitsValue;
  String? _critereChoixValue;
  String? _depensesDivertissementValue;

  final List<String> _typeMagasinOptions = ['Supermarché', 'Épicerie', 'Marché local', 'Boutique en ligne'];
  final List<String> _marqueProduitsOptions = ['Marque A', 'Marque B', 'Marque C', 'Marque D'];
  final List<String> _typeProduitsOptions = ['Fruits et légumes', 'Viande et poisson', 'Produits laitiers', 'Céréales et légumineuses'];
  final List<String> _critereChoixOptions = ['Prix', 'Qualité', 'Marque', 'Origine'];
  final List<String> _depensesDivertissementOptions = ['< 50€', '50-100€', '100-200€', '> 200€'];

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
                label: 'Quel type de magasin fréquentes-tu le plus pour tes achats quotidiens?',
                value: _typeMagasinValue,
                options: _typeMagasinOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _typeMagasinValue = value;
                  });
                },
                hintText: 'Sélectionnez le type de magasin',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Quelle marque de produits alimentaires achètes-tu le plus souvent?',
                value: _marqueProduitsValue,
                options: _marqueProduitsOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _marqueProduitsValue = value;
                  });
                },
                hintText: 'Sélectionnez la marque de produits',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Quels types de produits achètes-tu le plus souvent?',
                value: _typeProduitsValue,
                options: _typeProduitsOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _typeProduitsValue = value;
                  });
                },
                hintText: 'Sélectionnez le type de produits',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Quel est ton principal critère de choix lors de l\'achat d\'un produit alimentaire?',
                value: _critereChoixValue,
                options: _critereChoixOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _critereChoixValue = value;
                  });
                },
                hintText: 'Sélectionnez le critère de choix',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Combien dépenses-tu en moyenne par mois en divertissement (cinéma, concerts, abonnements de streaming, etc.)?',
                value: _depensesDivertissementValue,
                options: _depensesDivertissementOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _depensesDivertissementValue = value;
                  });
                },
                hintText: 'Sélectionnez le montant des dépenses',
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
                            MaterialPageRoute(builder: (context) => const TacheInfo9()),
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
