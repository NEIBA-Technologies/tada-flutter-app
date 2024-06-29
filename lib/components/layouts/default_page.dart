import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: bottomsheet,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 15,
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            Text(titlePage),
          ],
        ),
        iconTheme: IconThemeData(color: blackColor, size: 17),
        automaticallyImplyLeading: false,
      ),
      body: body,
    );
  }
}
