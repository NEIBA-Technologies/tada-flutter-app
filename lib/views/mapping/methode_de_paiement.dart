import 'package:flutter/material.dart';
import 'package:tada/views/connexion.dart';
import 'package:tada/widgets/app_button.dart';

class MethodePaiement extends StatefulWidget {
  const MethodePaiement({super.key});

  @override
  _MethodePaiementState createState() => _MethodePaiementState();
}

class _MethodePaiementState extends State<MethodePaiement> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
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
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                _buildRow('Titre', 'Entrez le titre de votre problème'),
                const SizedBox(height: 20),
                _buildRow('Description', 'Décrivez votre problème en détail'),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ContinuingButton(
                width: 361,
                height: 48,
                text: 'Continuer',
                fontSize: 16,
                borderRadius: 8,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignInForm()),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label1, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label1,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 10),
        Text(
          label2,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }
}
