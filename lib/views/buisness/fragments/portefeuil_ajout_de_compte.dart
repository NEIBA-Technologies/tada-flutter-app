// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tada/widgets/app_button.dart';
//
// class PortefeuilAjoutCompte extends StatefulWidget {
//   const PortefeuilAjoutCompte({super.key});
//
//   @override
//   _PortefeuilAjoutCompteState createState() => _PortefeuilAjoutCompteState();
// }
//
// class _PortefeuilAjoutCompteState extends State<PortefeuilAjoutCompte> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _accountNameController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
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
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     'asset/images/icon/smart_phone_Icon.svg',
//                     width: 32,
//                     height: 32,
//                   ),
//                   const SizedBox(width: 10),
//                   const Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Enregistrez un compte pour faire vos retraits d’argents ',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontFamily: "SoraSB",
//                             color: Color(0xff48505E)
//                             ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               _buildTextField(
//                 label: 'Nom du compte',
//                 controller: _accountNameController,
//                 keyboardType: TextInputType.name,
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer le nom du compte';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 label: 'Numéro de téléphone',
//                 controller: _phoneNumberController,
//                 keyboardType: TextInputType.phone,
//                 obscureText: false,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Veuillez entrer le numéro de téléphone';
//                   }
//                   return null;
//                 },
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
//                       //Navigator.push(
//                         //context,
//                         //MaterialPageRoute(builder: (context) => const VisiteDeMagasin3()),
//                       //);
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
