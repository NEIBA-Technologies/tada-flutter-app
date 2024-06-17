import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<List<TextStyle>> textStyles = [
    [
      const TextStyle(color: Color(0xff282828), fontSize: 16, fontFamily: "SoraSB"),
      const TextStyle(color: Color(0xff667085), fontSize: 14, fontFamily: "Gilroy"),
      const TextStyle(color: Color(0xff667085), fontSize: 14, fontFamily: "Gilroy"),
    ],
    [
      const TextStyle(color: Color(0xff282828), fontSize: 16, fontFamily: "SoraSB"),
      const TextStyle(color: Color(0xff667085), fontSize: 14, fontFamily: "Gilroy"),
      const TextStyle(color: Color(0xff667085), fontSize: 14, fontFamily: "Gilroy"),
    ],
    [
      const TextStyle(color: Color(0xff282828), fontSize: 16, fontFamily: "SoraSB"),
      const TextStyle(color: Color(0xff667085), fontSize: 14, fontFamily: "Gilroy"),
      const TextStyle(color: Color(0xff667085), fontSize: 14, fontFamily: "Gilroy"),
    ],
    [
      const TextStyle(color: Color(0xff282828), fontSize: 16, fontFamily: "SoraSB"),
      const TextStyle(color: Color(0xff667085), fontSize: 14, fontFamily: "Gilroy"),
      const TextStyle(color: Color(0xff667085), fontSize: 14, fontFamily: "Gilroy"),
    ],
  ];

  final List<List<String>> texts = [
    ['Nouvelle mission disponible', 'Consultez et répondez à cette nouvelle mission', '21/05/2024 à 13:06'],
    ['Paiement effectué', 'Vous avez reçu un paiement de XOF 500', '20/05/2024 à 08:46'],
    ['Votre tâche  a été validée ', 'L’examen de votre mission est terminé', '21/05/2024 à 07:46'],
    ['Retrait effectué','Votre compte à été débité avec succès','21/05/2024 à 07:46']
  ];

  NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontFamily: "SoraSB"
          )
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: texts.length, 
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: Colors.grey), 
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16), 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(texts[index].length, (textIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0), 
                    child: Text(
                      texts[index][textIndex],
                      style: textStyles[index][textIndex],
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
