import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PortefeuilAjoutCompte extends StatelessWidget {
  PortefeuilAjoutCompte({super.key});

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'asset/images/smart_phone_Icon.svg',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Enregistrez un compte pour faire vos retraits d’argents ',
                    style: TextStyle(fontSize: 16, fontFamily: "SoraSR"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Nom',
              controller: _lastNameController,
              keyboardType: TextInputType.name,
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
            ),
            _buildTextField(
              label: 'Prénom',
              controller: _firstNameController,
              keyboardType: TextInputType.name,
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre prénom';
                }
                return null;
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required bool obscureText,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            // Add other decoration properties as needed
          ),
        ),
      ],
    );
  }
}
