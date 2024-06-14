import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:tada/views/forget_psw2.dart';
import 'package:tada/views/visite_de_magasin3.dart';
import 'package:tada/widgets/app_button.dart';
//import 'package:tada/widgets/app_textfield.dart';

class VisiteDeMagasin2 extends StatefulWidget {
  const VisiteDeMagasin2({super.key});

  @override
  _VisiteDeMagasin2State createState() => _VisiteDeMagasin2State();
}

class _VisiteDeMagasin2State extends State<VisiteDeMagasin2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _magasinNameController = TextEditingController();
  final TextEditingController _gerantNameController = TextEditingController();
  final TextEditingController _gerantContactController = TextEditingController();
  final TextEditingController _photoEntreeController = TextEditingController();
  String? _selectedTypeMagasinOption;
  String? _selectedPaymentMethodOption;
  String? _selectedProductOption;

  final List<String> _typeMagasinOptions = [
    'Supermarché',
    'Épicerie',
    'Pharmacie',
  ];

  final List<String> _paymentMethodOptions = [
    'Carte de crédit',
    'Espèces',
    'Mobile Money',
  ];

  final List<String> _productOptions = [
    'Produits alimentaires',
    'Produits ménagers',
    'Produits de beauté',
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
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'asset/images/key.svg',
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const Text(
                      'Nous vous enverrons des instructions de réinitialisation par mail.',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Nom du magasin',
                controller: _magasinNameController,
                keyboardType: TextInputType.name,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du magasin';
                  }
                  return null;
                },
                hintText: 'Entrez le nom du magasin',
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
                svgImagePath: 'asset/images/celphoneIcon.svg',
                isLeftIcon: true,
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Type de magasin',
                value: _selectedTypeMagasinOption,
                options: _typeMagasinOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner un type de magasin';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedTypeMagasinOption = value;
                  });
                },
                hintText: 'Sélectionnez le type de magasin',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Photo de l’entrée',
                controller: _photoEntreeController,
                keyboardType: TextInputType.text,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez ajouter une photo de l’entrée';
                  }
                  return null;
                },
                hintText: 'Ajoutez une photo de l’entrée',
                svgImagePath: 'asset/images/cam_grey_Icon.svg',
                isRightIcon: true,
              ),
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
              _buildDropdownField(
                label: 'Produits en vente',
                value: _selectedProductOption,
                options: _productOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner un produit';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _selectedProductOption = value;
                  });
                },
                hintText: 'Sélectionnez les produits en vente',
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
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VisiteDeMagasin3())
                  );
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
