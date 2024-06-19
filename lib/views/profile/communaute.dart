import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Communaute extends StatelessWidget {
  const Communaute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rejoindre la communauté'),
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
                //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => const SupportContact2()),
                //);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Intégrer notre communauté Telegram ',
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
                //Navigator.push(
                  //context,
                  //MaterialPageRoute(builder: (context) => const SupportContact1()),
                //);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'S’abonner à nos actualités sur Facebook',
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
