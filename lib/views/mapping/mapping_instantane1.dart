import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/mapping/mapping_instantane2.dart';
import 'package:tada/widgets/app_button.dart';

class MappingInstantane1 extends StatefulWidget {
  const MappingInstantane1({super.key});

  @override
  _MappingInstantane1State createState() => _MappingInstantane1State();
}

class _MappingInstantane1State extends State<MappingInstantane1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mapping spontané ',
          style: TextStyle(
            fontSize: 14,
            fontFamily: "SoraSB",
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), 
          child: Container(
            color: Colors.grey, 
            height: 1.0,
          ),
        ),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 361,
                height: 168,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('asset/images/image/woman.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Merci de participer à cette mission de visite de magasin. Votre contribution est essentielle pour nous aider à collecter des informations précises et à jour sur les magasins de nos clients. Veuillez répondre aux questions suivantes avec soin et précision.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Gilroy",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(
                  question: 'Temps estimé :',
                  answer: '5min',
                  svgImagePath: 'asset/images/icon/horloge_Icon.svg',
                ),
                const SizedBox(height: 10),
                _buildRow(
                  question: 'Jours restants :',
                  answer: '3 jours',
                  svgImagePath: 'asset/images/icon/calendar_Icon.svg',
                ),
                const SizedBox(height: 10),
                _buildRow(
                  question: 'Gain :',
                  answer: '20,00 XOF',
                  svgImagePath: 'asset/images/icon/money_Icon.svg',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ContinuingButton(
                    width: 361,
                    height: 48,
                    text: 'Continuer',
                    fontSize: 16,
                    borderRadius: 8,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MappingInstantane2())
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required String question,
    required String answer,
    required String svgImagePath,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Gilroy"),
        ),
        const SizedBox(width: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              svgImagePath,
              height: 20,
              width: 20,
              color: Colors.black, 
            ),
            const SizedBox(width: 8),
            Text(
              answer,
              style: const TextStyle(
                fontFamily: "Gilroy",
                fontSize: 14
              ),
              ),
          ],
        ),
      ],
    );
  }
}
