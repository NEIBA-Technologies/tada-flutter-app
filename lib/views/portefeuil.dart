import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Portefeuil extends StatelessWidget {
  final Color backgroundColor;
  final double width;
  final double height;
  final double borderRadius;

  final Color container2BackgroundColor;
  final double container2Width;
  final double container2Height;

  const Portefeuil({
    super.key,
    this.backgroundColor = Colors.white,
    this.width = 361,
    this.height = 55.0,
    this.borderRadius = 8.0,
    this.container2BackgroundColor = Colors.white,
    this.container2Width = 361,
    this.container2Height = 157.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portefeuille'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'XOF 15.000',
                    style: TextStyle(
                      fontSize: 16,
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
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Transaction Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20.0), // Space between text and image
                      SvgPicture.asset(
                        'asset/images/Logomark.svg',
                        height: 24.0,
                        width: 24.0,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0), // Space between row and text
                  const Text(
                    'Transaction ID: 1234567890',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action on button press
                      },
                      child: const Text('View Details'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0), // Spacing before the list
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Transactions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10, // Number of items in the list
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Text 1',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          'Text 2',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.0), // Spacing between rows
                                    Text(
                                      'Additional Text',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
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
