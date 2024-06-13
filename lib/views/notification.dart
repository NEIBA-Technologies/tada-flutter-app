import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<List<TextStyle>> textStyles = [
    [
      const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
      const TextStyle(color: Colors.blue, fontSize: 14, fontStyle: FontStyle.italic),
      const TextStyle(color: Colors.green, fontSize: 12),
    ],
    [
      const TextStyle(color: Colors.orange, fontSize: 18, fontWeight: FontWeight.w600),
      const TextStyle(color: Colors.purple, fontSize: 16),
      const TextStyle(color: Colors.teal, fontSize: 14),
    ],
    [
      const TextStyle(color: Colors.black, fontSize: 14),
      const TextStyle(color: Colors.grey, fontSize: 12),
      const TextStyle(color: Colors.indigo, fontSize: 16, fontWeight: FontWeight.bold),
    ],
    [
      const TextStyle(color: Colors.black, fontSize: 14),
      const TextStyle(color: Colors.grey, fontSize: 12),
      const TextStyle(color: Colors.indigo, fontSize: 16, fontWeight: FontWeight.bold),
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
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); // Ferme cette page et retourne à la page précédente
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: texts.length, // Nombre de lignes à afficher
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: Colors.grey), // Séparateur horizontal
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16), // Espacement à gauche
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(texts[index].length, (textIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Espacement entre les textes
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
