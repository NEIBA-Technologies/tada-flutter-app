import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/contact_a_propos2.dart';
import 'package:tada/views/contact_a_propos3.dart';

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
              Navigator.pop(context); // Close this page and return to the previous page
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
                    'Text 1',
                    style: TextStyle(fontSize: 18),
                  ),
                  SvgPicture.asset(
                    'asset/images/right_arrow_Icon.svg', 
                    height: 24.0,
                    width: 24.0,
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
                    'Text 2',
                    style: TextStyle(fontSize: 18),
                  ),
                  SvgPicture.asset(
                    'asset/images/right_arrow_Icon.svg', 
                    height: 24.0,
                    width: 24.0,
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
