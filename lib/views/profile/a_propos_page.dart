import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/profile/contact_a_propos2.dart';
import 'package:tada/views/profile/contact_a_propos3.dart';

class APropos extends StatelessWidget {
  const APropos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support & contact'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); 
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactAPropos3()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Conditions d’utilisation',
                    style: TextStyle(fontSize: 14, fontFamily: "Gilroy"),
                  ),
                  SvgPicture.asset(
                    'asset/images/icon/right_arrow_Icon.svg', 
                    height: 12.0,
                    width: 6.0,
                  ),
                ],
              ),
            ),
            const Divider(height: 20, thickness: 1), 
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactAPropos2()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Politique de confidentialité',
                    style: TextStyle(fontSize: 14, fontFamily: "Gilroy"),
                  ),
                  SvgPicture.asset(
                    'asset/images/icon/right_arrow_Icon.svg', 
                    height: 12.0,
                    width: 6.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
