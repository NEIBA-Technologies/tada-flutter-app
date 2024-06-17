import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/enquet_terrain/enquet_terrain3.dart';
import 'package:tada/widgets/app_button.dart';

class MappingInstantane3 extends StatefulWidget {
  const MappingInstantane3({super.key});

  @override
  _MappingInstantane3State createState() => _MappingInstantane3State();
}

class _MappingInstantane3State extends State<MappingInstantane3> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _magasinOuvertureController = TextEditingController();
  final TextEditingController _magasinFermetureController = TextEditingController();
  final TextEditingController _gerantNameController = TextEditingController();
  final TextEditingController _gerantContactController = TextEditingController();
  final TextEditingController _contribuableNumberController = TextEditingController();

  String? _selectedPaymentMethodOption;


  final List<String> _paymentMethodOptions = [
    'Carte de crédit',
    'Espèces',
    'Mobile Money',
  ];


  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required bool obscureText,
    required String? Function(String?) validator,
    required String hintText,
    String? svgImagePath,
    bool isLeftIcon = false,
    bool isRightIcon = false,
    double width = 361,
    double height = 44,
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
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (svgImagePath != null && isLeftIcon)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    svgImagePath,
                    height: 24,
                    width: 24,
                  ),
                ),
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

  Widget _buildPhotoContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 361,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xffF0F1F3),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              const Center(
                child: Text(
                  'Ajoutez une photo de l’entrée',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Couleur de fond
                    borderRadius: BorderRadius.circular(15), // Bordures arrondies
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,),
                    child: TextButton(
                      onPressed: () {
                        // Logique pour ajouter une photo
                      },
                      child: const Text(
                        'Ajouter',
                        style: TextStyle(
                          color: Colors.white, // Couleur du texte
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTextField(
                    label: 'Ouverture',
                    controller: _magasinOuvertureController,
                    keyboardType: TextInputType.datetime,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer l\'heure d\'ouverture';
                      }
                      return null;
                    },
                    hintText: 'Ouverture',
                    width: 173,
                    height: 44,
                  ),
                  _buildTextField(
                    label: 'Fermeture',
                    controller: _magasinFermetureController,
                    keyboardType: TextInputType.datetime,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer l\'heure de fermeture';
                      }
                      return null;
                    },
                    hintText: 'Fermeture',
                    width: 173,
                    height: 44,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Nom du gérant',
                controller: _gerantNameController,
                keyboardType: TextInputType.name,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du gérant';
                  }
                  return null;
                },
                hintText: 'Entrez le nom du gérant',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Contact du gérant',
                controller: _gerantContactController,
                keyboardType: TextInputType.phone,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le contact du gérant';
                  }
                  return null;
                },
                hintText: 'Entrez le contact du gérant',
                svgImagePath: 'asset/images/cible_Icon.svg',
                isRightIcon: true,
              ),
              const SizedBox(height: 5),
              _buildPhotoContainer(),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Méthodes de paiement disponibles',
                value: _selectedPaymentMethodOption,
                options: _paymentMethodOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une méthode de paiement';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethodOption = value;
                  });
                },
                hintText: 'Sélectionnez les méthodes de paiement disponibles',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Numéro de contribuable',
                controller: _contribuableNumberController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le numéro de contribuable';
                  }
                  return null;
                },
                hintText: 'Entrez le numéro de contribuable',
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
                            MaterialPageRoute(builder: (context) => const VisiteDeMagasin3())
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
