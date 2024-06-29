import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';

import '../../core/constants.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  Widget build(BuildContext context) {

    return ScaffoldPage(
      titlePage: 'Mon portefeuille',
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: padding * 2),
          child: const Center(
            child: Text('Tada'),
          )),
    );
  }
}
