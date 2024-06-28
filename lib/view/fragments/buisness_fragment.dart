import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';

import '../../core/constants.dart';

class BusinessFragment extends StatefulWidget {
  const BusinessFragment({super.key});

  @override
  State<BusinessFragment> createState() => _BusinessFragmentState();
}

class _BusinessFragmentState extends State<BusinessFragment> {
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
