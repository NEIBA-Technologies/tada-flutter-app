import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/mot%20de%20passe/forget_psw2.dart';
import 'package:tada/widgets/app_button.dart';

class VisiteDeMagasin3 extends StatefulWidget {
  const VisiteDeMagasin3({super.key});

  @override
  _VisiteDeMagasin3State createState() => _VisiteDeMagasin3State();
}

class _VisiteDeMagasin3State extends State<VisiteDeMagasin3> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDurationOption;
  String? _selectedAmbianceOption;
  String? _selectedEquipmentsOption;
  String? _selectedSodaBrandsOption;
  String? _selectedSodaStockOption;
  String? _selectedSodaPriceOption;

  final List<String> _durationOptions = [
    '30 minutes',
    '1 heure',
    '1 heure 30 minutes',
    '2 heures',
  ];

  final List<String> _ambianceOptions = [
    'Calme',
    'Animé',
    'Décontracté',
  ];

  final List<String> _equipmentsOptions = [
    'Écrans LCD',
    'Système de sonorisation',
    'Chaises ergonomiques',
  ];

  final List<String> _sodaBrandsOptions = [
    'Coca-Cola',
    'Pepsi',
    'Fanta',
  ];

  final List<String> _sodaStockOptions = [
    '100 bouteilles',
    '200 bouteilles',
    '300 bouteilles',
  ];

  final List<String> _sodaPriceOptions = [
    '1000 FCFA',
    '1500 FCFA',
    '2000 FCFA',
  ];

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> options,
    required String? Function(String?) validator,
    required void Function(String?) onChanged,
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
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
              const Center(
                child: Column(

                ),
              ),
              const SizedBox(height: 20),
              _buildDropdownField(
                label: 'Durée de la visite',
                value: _selectedDurationOption,
                options: _durationOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une durée';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedDurationOption = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Ambiance',
                value: _selectedAmbianceOption,
                options: _ambianceOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une ambiance';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedAmbianceOption = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Équipements & Installations',
                value: _selectedEquipmentsOption,
                options: _equipmentsOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner des équipements';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedEquipmentsOption = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Marques de Soda disponibles',
                value: _selectedSodaBrandsOption,
                options: _sodaBrandsOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une marque de soda';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedSodaBrandsOption = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Quantité de Soda en stock',
                value: _selectedSodaStockOption,
                options: _sodaStockOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une quantité de soda';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedSodaStockOption = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Prix de Soda',
                value: _selectedSodaPriceOption,
                options: _sodaPriceOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner un prix de soda';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedSodaPriceOption = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ContinuingButton(
                      width: 361,
                      height: 48,
                      text: 'Envoyer',
                      fontSize: 16,
                      borderRadius: 8,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPSW2(),
                            ),
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
