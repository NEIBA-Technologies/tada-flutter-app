import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/portefeuil/portefeuil_retrait1.dart';
import 'package:tada/views/portefeuil/portefeuil_ajout_de_compte.dart';
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
    this.container2Height = 160.0,
  });

  // Liste de transactions
  final List<Transaction> transactions = [
    Transaction(
      text1: 'Enquête cliblées',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '+1500 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xff039855)),
      additionalText: 'Mission payé . 21/05/2024 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Retrait d’argent',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '-5000 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xffFF5B4A)),
      additionalText: 'Retrait validé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Enquête cliblées',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '+1500 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xff039855)),
      additionalText: 'Mission payé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Enquête cliblées',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '+1500 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xff039855)),
      additionalText: 'Mission payé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Retrait d’argent',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '-5000 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xffFF5B4A)),
      additionalText: 'Retrait validé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Enquête cliblées',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '+1500 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xff039855)),
      additionalText: 'Mission payé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Retrait d’argent',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '-5000 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xffFF5B4A)),
      additionalText: 'Retrait validé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Enquête cliblées',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '+1500 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xff039855)),
      additionalText: 'Mission payé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Retrait d’argent',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '-5000 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xffFF5B4A)),
      additionalText: 'Retrait validé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
    ),
    Transaction(
      text1: 'Enquête cliblées',
      text1Style: const TextStyle(fontSize: 14, fontFamily: "SoraSB", color: Color(0xff282828)),
      text2: '+1500 XOF',
      text2Style: const TextStyle(fontSize: 12, fontFamily: "SoraR", color: Color(0xff039855)),
      additionalText: 'Mission payé . 07:19',
      additionalTextStyle: const TextStyle(fontSize: 12, fontFamily: "Gilroy", color: Color(0xff989FAD)),
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
                      fontFamily: "Gilroy",
                    ),
                  ),
                  Text(
                    'XOF 15.000',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "SoraSB",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0), 
            Container(
              width: container2Width,
              height: container2Height,
              decoration: BoxDecoration(
                color: container2BackgroundColor,
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2), 
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Solde XOF 1500,0',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "SoraSB",
                        ),
                      ),
                      // Ajout de l'image SVG à droite du texte
                      SvgPicture.asset(
                        'asset/images/icon/Logomark.svg',
                        width: 16, 
                        height: 24, 
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0), 
                  const Text(
                    'Encore XOF 3500 avant de retirer',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "SoraR"
                    ),
                  ),
                const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: ContinuingButton(
                      width: 321,
                      height: 48,
                      text: 'Retirer son argent',
                      fontSize: 16,
                      borderRadius: 8,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PortefeuilRetrai1()),
                        );
                        const SizedBox(height: 20.0);
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
                    fontSize: 16,
                    fontFamily: "SoraSB",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3.0), 
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
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
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
                                  const SizedBox(height: 8.0), 
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PortefeuilAjoutCompte()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const CustomCard(
                  title: 'Ajouter un compte mobile',
                  description: 'Enregistrez un compte pour faire vos retraits d’argents ',
                  leftSvgPath: 'asset/images/icon/smart_phone_Icon.svg',
                  rightSvgPath: null,
                  leftBackgroundColor: Color(0xfffFFfff),
                  width: 361,
                  height: 105,
                  borderRadius: 4.0,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}

