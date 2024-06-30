// import 'package:flutter/material.dart';
// import 'package:tada/old_doc/lib/widgets/app_button.dart';
//
// class TacheInfo9 extends StatefulWidget {
//   const TacheInfo9({super.key});
//
//   @override
//   _TacheInfo9State createState() => _TacheInfo9State();
// }
//
// class _TacheInfo9State extends State<TacheInfo9> {
//   final _formKey = GlobalKey<FormState>();
//
//   String? _produitsTechnologiquesValue;
//   String? _frequenceAchatsVetementsValue;
//   String? _criteresVetementsValue;
//
//   final List<String> _produitsTechnologiquesOptions = ['Smartphones', 'Ordinateurs', 'Tablettes', 'Accessoires'];
//   final List<String> _frequenceAchatsVetementsOptions = ['Rarement', 'Occasionnellement', 'Souvent', 'Très souvent'];
//   final List<String> _criteresVetementsOptions = ['Prix', 'Qualité', 'Marque', 'Style'];
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
//               _buildDropdownField(
//                 label: 'Quels types de produits technologiques achètes-tu le plus souvent?',
//                 value: _produitsTechnologiquesValue,
//                 options: _produitsTechnologiquesOptions,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez sélectionner une option';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _produitsTechnologiquesValue = value;
//                   });
//                 },
//                 hintText: 'Sélectionnez le type de produits technologiques',
//               ),
//               const SizedBox(height: 10),
//               _buildDropdownField(
//                 label: 'À quelle fréquence achètes-tu des vêtements?',
//                 value: _frequenceAchatsVetementsValue,
//                 options: _frequenceAchatsVetementsOptions,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez sélectionner une option';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _frequenceAchatsVetementsValue = value;
//                   });
//                 },
//                 hintText: 'Sélectionnez la fréquence d\'achats de vêtements',
//               ),
//               const SizedBox(height: 10),
//               _buildDropdownField(
//                 label: 'Quels sont tes critères principaux pour l\'achat de vêtements?',
//                 value: _criteresVetementsValue,
//                 options: _criteresVetementsOptions,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez sélectionner une option';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     _criteresVetementsValue = value;
//                   });
//                 },
//                 hintText: 'Sélectionnez les critères de choix',
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
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const TacheInfo9()),
//                           );
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
