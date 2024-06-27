// import 'package:flutter/material.dart';
// import 'package:tada/widgets/app_button.dart';
//
// class PortefeuilRetrait2 extends StatelessWidget {
//   const PortefeuilRetrait2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sample Page'),
//       ),
//       body: Stack(
//         children: [
//           const Positioned(
//             top: 0,
//             left: 0,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Solde',
//                     style: TextStyle(fontSize: 16, fontFamily: "SoraR"),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'XOF 1500,0',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: "SoraSB",
//                       color: Color(0xffFF5B4A),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Retrait minimum - XOF 5000',
//                     style: TextStyle(
//                       fontSize: 10,
//                       fontFamily: "Gilroy",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const Center(
//             child: Text(
//               'XOF 1500,0',
//               style: TextStyle(fontSize: 28, fontFamily: "SoraSB"),
//             ),
//           ),
//           Positioned(
//             bottom: 16.0,
//             left: 16.0,
//             right: 16.0,
//             child: ContinuingButton(
//                       width: 321,
//                       height: 48,
//                       text: 'Envoyer',
//                       fontSize: 16,
//                       borderRadius: 8,
//                       onPressed: () {
//                         Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const  PortefeuilRetrait2())
//                         );
//                       },
//                     ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
