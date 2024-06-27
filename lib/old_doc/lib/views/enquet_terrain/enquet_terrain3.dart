import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnquetTerrain3 extends StatefulWidget {
  const EnquetTerrain3({super.key});

  @override
  _EnquetTerrain3State createState() => _EnquetTerrain3State();
}

class _EnquetTerrain3State extends State<EnquetTerrain3> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _equipementController = TextEditingController();
  final TextEditingController _ouiNonController = TextEditingController();
  final TextEditingController _quantiteStockController = TextEditingController();
  final TextEditingController _prixVenteController = TextEditingController();
  final TextEditingController _prixAchatController = TextEditingController();
  final TextEditingController _photoController = TextEditingController();
  final TextEditingController _photoEntrerController = TextEditingController();

  final List<String> _equipementOptions = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> _ouiNonOptions = ['Oui', 'Non'];

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
                label: 'Équipement & Installation',
                value: _equipementController.text.isEmpty ? null : _equipementController.text,
                options: _equipementOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _equipementController.text = value ?? '';
                  });
                },
                hintText: 'Sélectionnez une option',
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                label: 'Optionnel Oui/Non',
                value: _ouiNonController.text.isEmpty ? null : _ouiNonController.text,
                options: _ouiNonOptions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner une option';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _ouiNonController.text = value ?? '';
                  });
                },
                hintText: 'Sélectionnez Oui ou Non',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Quantité de Stock',
                controller: _quantiteStockController,
                keyboardType: TextInputType.number,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la quantité de stock';
                  }
                  return null;
                },
                hintText: 'Entrez la quantité de stock',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Photo du Code Barre',
                controller:_photoEntrerController,
                keyboardType: TextInputType.number,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prix de vente';
                  }
                  return null;
                },
                hintText: 'Entrez le prix de vente',
                svgImagePath: 'asset/images/icon/cam_grey_Icon.svg',
                isRightIcon: true,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Photo du Produit sur les Étages',
                controller: _photoController,
                keyboardType: TextInputType.number,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prix d\'achat';
                  }
                  return null;
                },
                hintText: 'Entrez le prix d\'achat',
                svgImagePath: 'asset/images/icon/cam_grey_Icon.svg',
                isRightIcon: true,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Prix de Vente',
                controller: _prixVenteController,
                keyboardType: TextInputType.number,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prix de vente';
                  }
                  return null;
                },
                hintText: 'Entrez le prix de vente',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Prix d\'Achat',
                controller: _prixAchatController,
                keyboardType: TextInputType.number,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prix d\'achat';
                  }
                  return null;
                },
                hintText: 'Entrez le prix d\'achat',
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
                            MaterialPageRoute(builder: (context) => const EnquetTerrain4()),
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
