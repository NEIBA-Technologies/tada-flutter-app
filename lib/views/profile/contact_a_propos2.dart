import 'package:flutter/material.dart';


class ContactAPropos2 extends StatelessWidget {
  const ContactAPropos2({super.key});

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
      body: Center(
        child: Container(
          width: 361,
          height: 646,
          padding: const EdgeInsets.all(16.0),
          color: Colors.white, 
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Conditions d’utilisation Tada',
                style: TextStyle(fontSize: 20, fontFamily: "SoraSB", color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
