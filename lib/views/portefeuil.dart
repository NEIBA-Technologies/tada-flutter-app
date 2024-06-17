import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/widgets/app_button.dart';
import 'package:tada/widgets/custom_card.dart';

// Modèle de données pour les transactions
class Transaction {
  final String text1;
  final TextStyle text1Style;
  final String text2;
  final TextStyle text2Style;
  final String additionalText;
  final TextStyle additionalTextStyle;

  Transaction({
    required this.text1,
    required this.text1Style,
    required this.text2,
    required this.text2Style,
    required this.additionalText,
    required this.additionalTextStyle,
  });
}

class Portefeuil extends StatelessWidget {
  final Color backgroundColor;
  final double width;
  final double height;
  final double borderRadius;

  final Color container2BackgroundColor;
  final double container2Width;
  final double container2Height;

  Portefeuil({
    super.key,
    this.backgroundColor = const Color(0xffFFE2B0),
    this.width = 361,
    this.height = 55.0,
    this.borderRadius = 8.0,
    this.container2BackgroundColor = Colors.white,
    this.container2Width = 361,
    this.container2Height = 157.0,
  });

  // Liste de transactions
  final List<Transaction> transactions = [
    Transaction(
      text1: 'Transaction 1',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
      text2: '10:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 1',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    Transaction(
      text1: 'Transaction 2',
      text1Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),
      text2: '11:00 AM',
      text2Style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
      additionalText: 'Description 2',
      additionalTextStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
    ),
    // Ajoutez d'autres transactions ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text('Portefeuille'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10.0),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Argent encaissé',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'XOF 15.000',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0), // Spacing between the two containers
            Container(
              width: container2Width,
              height: container2Height,
              decoration: BoxDecoration(
                color: container2BackgroundColor,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Solde XOF 1500,0',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0), // Space between row and text
                  const Text(
                    'Encore XOF 3500 avant de retirer',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: ContinuingButton(
                      width: 321,
                      height: 48,
                      text: 'Envoyer',
                      fontSize: 16,
                      borderRadius: 8,
                      onPressed: () {
                        //Navigator.push(
                        //context,
                        //MaterialPageRoute(builder: (context) => const ForgetPSW2())
                        //);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 361,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3.0), // Spacing before the list
            Container(
              width: 361,
              height: 500, 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        transactions[index].text1,
                                        style: transactions[index].text1Style,
                                      ),
                                      Text(
                                        transactions[index].text2,
                                        style: transactions[index].text2Style,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0), // Spacing between rows
                                  Text(
                                    transactions[index].additionalText,
                                    style: transactions[index].additionalTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const CustomCard(
                title: 'Ajouter un compte mobile',
                description: 'Enregistrez un compte pour faire vos retraits d’argents ',
                leftSvgPath: 'asset/images/smart_phone_Icon.svg',
                rightSvgPath: null,
                leftBackgroundColor: Color(0xfffFFfff),
                width: 361,
                height: 105,
                borderRadius: 4.0,
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
