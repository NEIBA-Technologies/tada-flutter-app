// import 'package:flutter/material.dart';
// import 'package:tada/widgets/app_button.dart';
//
// class ModifPSW extends StatefulWidget {
//   const ModifPSW({super.key});
//
//   @override
//   _ModifPSWState createState() => _ModifPSWState();
// }
//
// class _ModifPSWState extends State<ModifPSW> {
//   // final _formKey = GlobalKey<FormState>();
//   // final TextEditingController _oldPasswordController = TextEditingController();
//   // final TextEditingController _newPasswordController = TextEditingController();
//   // final TextEditingController _confirmPasswordController = TextEditingController();
//   //
//   // Widget _buildTextField({
//   //   required String hint,
//   //   required TextEditingController controller,
//   //   required bool obscureText,
//   //   required String? Function(String?) validator,
//   // }) {
//   //   return Column(
//   //     crossAxisAlignment: CrossAxisAlignment.start,
//   //     children: [
//   //       const SizedBox(height: 10),
//   //       TextFormField(
//   //         controller: controller,
//   //         obscureText: obscureText,
//   //         decoration: InputDecoration(
//   //           hintText: hint,
//   //           border: OutlineInputBorder(
//   //             borderRadius: BorderRadius.circular(8),
//   //           ),
//   //           contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//   //         ),
//   //         validator: validator,
//   //       ),
//   //     ],
//   //   );
//   // }
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       backgroundColor: Colors.white,
//   //       elevation: 0,
//   //       leading: IconButton(
//   //         icon: const Icon(Icons.arrow_back, color: Colors.black),
//   //         onPressed: () => Navigator.of(context).pop(),
//   //       ),
//   //     ),
//   //     body: SingleChildScrollView(
//   //       padding: const EdgeInsets.all(16.0),
//   //       child: Form(
//   //         key: _formKey,
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             const SizedBox(height: 20),
//   //             _buildTextField(
//   //               hint: 'Ancien mot de passe',
//   //               controller: _oldPasswordController,
//   //               obscureText: true,
//   //               validator: (value) {
//   //                 if (value == null || value.isEmpty) {
//   //                   return 'Veuillez entrer votre ancien mot de passe';
//   //                 }
//   //                 return null;
//   //               },
//   //             ),
//   //             const SizedBox(height: 20),
//   //             _buildTextField(
//   //               hint: 'Nouveau mot de passe',
//   //               controller: _newPasswordController,
//   //               obscureText: true,
//   //               validator: (value) {
//   //                 if (value == null || value.isEmpty) {
//   //                   return 'Veuillez entrer votre nouveau mot de passe';
//   //                 }
//   //                 return null;
//   //               },
//   //             ),
//   //             const SizedBox(height: 20),
//   //             _buildTextField(
//   //               hint: 'Confirmer le mot de passe',
//   //               controller: _confirmPasswordController,
//   //               obscureText: true,
//   //               validator: (value) {
//   //                 if (value == null || value.isEmpty) {
//   //                   return 'Veuillez confirmer votre nouveau mot de passe';
//   //                 } else if (value != _newPasswordController.text) {
//   //                   return 'Les mots de passe ne correspondent pas';
//   //                 }
//   //                 return null;
//   //               },
//   //             ),
//   //             const SizedBox(height: 20),
//   //             Center(
//   //               child: ContinuingButton(
//   //                 width: 361,
//   //                 height: 48,
//   //                 text: 'Continuer',
//   //                 fontSize: 16,
//   //                 borderRadius: 8,
//   //                 onPressed: () {
//   //                   if (_formKey.currentState!.validate()) {
//   //                     // Action à effectuer lorsqu'on appuie sur Continuer
//   //                   }
//   //                 },
//   //               ),
//   //             ),
//   //             const SizedBox(height: 10),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
