import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/profile/support_et_contacts2.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const SupportContacts2()),);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor:  Colors.white,
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
                          'Signaler un problème au service client',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Gilroy",
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'asset/images/icon/right_arrow_Icon.svg',
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
              'Introduction à Tada',
              style: TextStyle(
                fontSize: 16,
                fontFamily: "SoraSB",
              ),
            ),
          ],
        ),
      ),
      children: [
        _buildTextRow('Quelles sont les méthodes de paiement disponible'),
        const Divider(),
        _buildTextRow('Quelles sont les méthodes de paiement disponible'),
        const Divider(),
        _buildTextRow('Quelles sont les méthodes de paiement disponible'),
        const Divider(),
        _buildTextRow('Quelles sont les méthodes de paiement disponible'),
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
            fontSize: 12,
            fontFamily: "Gilroy"
          ),
        ),
      ),
    );
  }
}
