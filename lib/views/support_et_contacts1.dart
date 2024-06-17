import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupportContacts1 extends StatefulWidget {
  const SupportContacts1({super.key});

  @override
  _SupportContacts1State createState() => _SupportContacts1State();
}

class _SupportContacts1State extends State<SupportContacts1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 361,
              height: 55,
              child: TextButton(
                onPressed: () {
                  // Action du bouton
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: const Color(0xffFFCCC7),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Texte 1',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'asset/images/right_arrow_Icon.svg',
                      width: 6,
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildExpansionTile(),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile() {
    return ExpansionTile(
      title: const SizedBox(
        width: 361,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Titre',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      children: [
        _buildTextRow('Description 1'),
        const Divider(),
        _buildTextRow('Description 2'),
        const Divider(),
        _buildTextRow('Description 3'),
      ],
    );
  }

  Widget _buildTextRow(String text) {
    return Container(
      width: 361,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
