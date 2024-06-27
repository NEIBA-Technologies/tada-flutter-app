// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tada/widgets/app_button.dart';
//
// class CompteModifProfile extends StatefulWidget {
//   const CompteModifProfile({super.key});
//
//   @override
//   _CompteModifProfileState createState() => _CompteModifProfileState();
// }
//
// class _CompteModifProfileState extends State<CompteModifProfile> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//
//   Widget _buildTextField({
//     required String label,
//     required TextEditingController controller,
//     required TextInputType keyboardType,
//     required bool obscureText,
//     required String? Function(String?) validator,
//     String? svgImagePath,
//     bool isLeftIcon = false,
//     bool isRightIcon = false,
//     double width = 361,
//     double height = 44,
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
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               if (svgImagePath != null && isLeftIcon)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: SvgPicture.asset(
//                     svgImagePath,
//                     height: 24,
//                     width: 24,
//                   ),
//                 ),
//               Expanded(
//                 child: TextFormField(
//                   controller: controller,
//                   obscureText: obscureText,
//                   keyboardType: keyboardType,
//                   decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
//               const SizedBox(height: 20),
//               Center(
//                 child: Stack(
//                   alignment: Alignment.center,
//                   clipBehavior: Clip.none,
//                   children: [
//                     const CircleAvatar(
//                       radius: 40,
//                       backgroundImage: AssetImage('asset/images/image/profil_picture.jpg'),
//                     ),
//                     Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: CircleAvatar(
//                         radius: 15,
//                         backgroundColor: Colors.white,
//                         child: SvgPicture.asset(
//                           'asset/images/icon/edit_Icon.svg',
//                           width: 16,
//                           height: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _buildTextField(
//                 label: 'Nom complet',
//                 controller: _fullNameController,
//                 keyboardType: TextInputType.name,
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer votre nom complet';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 label: 'Adresse mail',
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer votre adresse mail';
//                   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return 'Veuillez entrer une adresse mail valide';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Action pour le bouton
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black, backgroundColor: Colors.white,
//                     side: const BorderSide(color: Colors.black),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     textStyle: const TextStyle(fontSize: 16),
//                     fixedSize: const Size(361, 48),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text(
//                         'Ajouter plus d’informations',
//                         style: TextStyle(
//                           fontFamily: "SoraR",
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       SvgPicture.asset(
//                         'asset/images/icon/Right.svg',
//                         width: 14.59,
//                         height: 8,
//                       ),
//                     ],
//                   ),
//                 ),
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
//                     if (_formKey.currentState!.validate()) {
//
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
