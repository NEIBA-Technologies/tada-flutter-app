import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Page'),
      ),
      body: const Stack(
        children: [
          // Column positioned at the top left
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Solde',
                    style: TextStyle(fontSize: 16, fontFamily: "SoraR"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    ' XOF 1500,0',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "SoraSB",
                      color: Color(0xffFF5B4A)
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Retrait minimum -  XOF 5000 ',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: "Gilroy",
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Text positioned at the center of the screen
          Center(
            child: Text(
              ' XOF 1500,0',
              style: TextStyle(fontSize: 28, fontFamily: "SoraSb"),
            ),
          ),
        ],
      ),
    );
  }
}


