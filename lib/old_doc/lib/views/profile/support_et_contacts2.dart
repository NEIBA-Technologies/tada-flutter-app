// import 'package:flutter/material.dart';
// import 'package:tada/views/sign_in_screen.dart';
// import 'package:tada/widgets/app_button.dart';
//
// class SupportContacts2 extends StatefulWidget {
//   const SupportContacts2({super.key});
//
//   @override
//   _SupportContacts2State createState() => _SupportContacts2State();
// }
//
// class _SupportContacts2State extends State<SupportContacts2> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//
//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }
//
//   Widget _buildTextField({
//     required String label,
//     required TextEditingController controller,
//     required TextInputType keyboardType,
//     required bool obscureText,
//     required String? Function(String?) validator,
//     required double width,
//     required double height,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 10),
//         Text(
//           label,
//           style: const TextStyle(color: Colors.black),
//         ),
//         SizedBox(
//           width: width,
//           height: height,
//           child: TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             obscureText: obscureText,
//             validator: validator,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//             ),
//             maxLines: label == 'Description' ? 4 : 1,
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Center(
//                 child: Column(
//
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _buildTextField(
//                 label: 'Titre',
//                 controller: _titleController,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer un titre';
//                   }
//                   return null;
//                 },
//                 width: 361,
//                 height: 44,
//               ),
//               _buildTextField(
//                 label: 'Description',
//                 controller: _descriptionController,
//                 keyboardType: TextInputType.multiline,
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer une description';
//                   }
//                   return null;
//                 },
//                 width: 361,
//                 height: 132,
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: ContinuingButton(
//                   width: 361,
//                   height: 48,
//                   text: 'Continuer',
//                   fontSize: 16,
//                   borderRadius: 8,
//                   onPressed: () {
//                     if (_formKey.currentState?.validate() ?? false) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const SignInForm()),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
