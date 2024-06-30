// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tada/old_doc/lib/widgets/app_button.dart';
//
// class TacheInfo6 extends StatefulWidget {
//   const TacheInfo6({super.key});
//
//   @override
//   _TacheInfo6State createState() => _TacheInfo6State();
// }
//
// class _TacheInfo6State extends State<TacheInfo6> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _boissonPrefereeController = TextEditingController();
//   final TextEditingController _banqueCompteController = TextEditingController();
//   final TextEditingController _typeCompteController = TextEditingController();
//   final TextEditingController _typeAssuranceController = TextEditingController();
//   final TextEditingController _societeAssuranceController = TextEditingController();
//
//   String? _compteBancaireValue;
//   String? _assuranceValue;
//
//   final List<String> _compteBancaireOptions = ['Oui', 'Non'];
//   final List<String> _assuranceOptions = ['Oui', 'Non'];
//
//   Widget _buildTextField({
//     required String label,
//     required TextEditingController controller,
//     required TextInputType keyboardType,
//     required bool obscureText,
//     required String? Function(String?) validator,
//     required String hintText,
//     String? svgImagePath,
//     bool isRightIcon = false,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 10),
//         Text(
//           label,
//           style: const TextStyle(color: Colors.black),
//         ),
//         const SizedBox(height: 10),
//         Container(
//           width: 361,
//           height: 44,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   controller: controller,
//                   obscureText: obscureText,
//                   keyboardType: keyboardType,
//                   decoration: InputDecoration(
//                     hintText: hintText,
//                     border: InputBorder.none,
//                     contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//                   ),
//                   validator: validator,
//                 ),
//               ),
//               if (svgImagePath != null && isRightIcon)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: SvgPicture.asset(
//                     svgImagePath,
//                     height: 24,
//                     width: 24,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDropdownField({
//     required String label,
//     required String? value,
//     required List<String> options,
//     required String? Function(String?) validator,
//     required void Function(String?) onChanged,
//     required String hintText,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 10),
//         Text(
//           label,
//           style: const TextStyle(color: Colors.black),
//         ),
//         const SizedBox(height: 10),
//         Container(
//           width: 361,
//           height: 44,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: DropdownButtonFormField<String>(
//             value: value,
//             items: options.map((String option) {
//               return DropdownMenuItem<String>(
//                 value: option,
//                 child: Text(option),
//               );
//             }).toList(),
//             onChanged: onChanged,
//             validator: validator,
//             decoration: InputDecoration(
//               hintText: hintText,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//               border: InputBorder.none,
//             ),
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
//               _buildTextField(
//                 label: 'Quelle est ta boisson préférée?',
//                 controller: _boissonPrefereeController,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer votre boisson préférée';
//                   }
//                   return null;
//                 },
//                 hintText: 'Entrez votre boisson préférée',
//               ),
//               const SizedBox(height: 10),
//               _buildDropdownField(
//                 label: 'As-tu un compte bancaire?',
//                 value: _compteBancaireValue,
//                 options: _compteBancaireOptions,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez sélectionner une option';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _compteBancaireValue = value;
//                   });
//                 },
//                 hintText: 'Sélectionnez Oui ou Non',
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 label: 'Dans quelles banques as-tu un compte?',
//                 controller: _banqueCompteController,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 validator: (value) {
//                   if (_compteBancaireValue == 'Oui' && (value == null || value.isEmpty)) {
//                     return 'Veuillez entrer les banques où vous avez un compte';
//                   }
//                   return null;
//                 },
//                 hintText: 'Entrez les banques où vous avez un compte',
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 label: 'Quel type de compte disposes-tu?',
//                 controller: _typeCompteController,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 validator: (value) {
//                   if (_compteBancaireValue == 'Oui' && (value == null || value.isEmpty)) {
//                     return 'Veuillez entrer le type de compte';
//                   }
//                   return null;
//                 },
//                 hintText: 'Entrez le type de compte',
//               ),
//               const SizedBox(height: 10),
//               _buildDropdownField(
//                 label: 'As-tu souscris à une assurance?',
//                 value: _assuranceValue,
//                 options: _assuranceOptions,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez sélectionner une option';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _assuranceValue = value;
//                   });
//                 },
//                 hintText: 'Sélectionnez Oui ou Non',
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 label: 'Quel type d’assurance?',
//                 controller: _typeAssuranceController,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 validator: (value) {
//                   if (_assuranceValue == 'Oui' && (value == null || value.isEmpty)) {
//                     return 'Veuillez entrer le type d’assurance';
//                   }
//                   return null;
//                 },
//                 hintText: 'Entrez le type d’assurance',
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 label: 'Avec quelle société d’assurance es-tu?',
//                 controller: _societeAssuranceController,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 validator: (value) {
//                   if (_assuranceValue == 'Oui' && (value == null || value.isEmpty)) {
//                     return 'Veuillez entrer la société d’assurance';
//                   }
//                   return null;
//                 },
//                 hintText: 'Entrez la société d’assurance',
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: Column(
//                   children: [
//                     ContinuingButton(
//                       width: 361,
//                       height: 48,
//                       text: 'Continuer',
//                       fontSize: 16,
//                       borderRadius: 8,
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(builder: (context) => const TacheInfo7()),
//                           // );
//                         }
//                       },
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
