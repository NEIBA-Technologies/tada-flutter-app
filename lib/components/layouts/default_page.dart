import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  final String titlePage;
  final Widget body;
  final Widget? bottomsheet;

  const DefaultPage(
      {super.key,
      required this.titlePage,
       this.bottomsheet,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: bottomsheet,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Row(
          children: [
            GestureDetector(
              onTap: () {
               Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
            SizedBox(width: 10,),
            Text("${titlePage}"),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: body,
    );
  }
}
