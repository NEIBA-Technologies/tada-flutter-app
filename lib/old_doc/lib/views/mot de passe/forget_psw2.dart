// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tada/views/mot%20de%20passe/forget_psw3.dart';
// import 'package:tada/widgets/app_button.dart';
//
// class ForgetPSW2 extends StatelessWidget {
//   const ForgetPSW2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation:0,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 'asset/images/icon/mail.svg',
//                 width: 24,
//                 height: 24,
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 'Consultez vos mails',
//                 style: TextStyle(color: Colors.black, fontSize: 18),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Nous avons envoyé un lien de réinitialisation du mot de passe à name@yourmail.com',
//                 style: TextStyle(color: Colors.black54, fontSize: 14),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               ContinuingButton(
//                 width: 361,
//                 height: 48,
//                 text: 'Ouvrir vos mails',
//                 fontSize: 16,
//                 borderRadius: 8,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ForgetPSW3()),
//                   );
//                 },
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Vous n’avez pas reçu de mail?',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'Cliquez pour renvoyer',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SvgPicture.asset(
//                       'asset/images/icon/retour.svg',
//                       height: 11.67,
//                       width: 11.67,
//                       color: const Color(0xff48505E),
//                     ),
//                     const SizedBox(width: 4), // Espacement entre l'image et le texte
//                     const Text(
//                       'Retour à connexion',
//                       style: TextStyle(color: Color(0xff48505E)),
//                     ),
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
