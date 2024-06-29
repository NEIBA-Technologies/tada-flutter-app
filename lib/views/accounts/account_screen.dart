import 'package:flutter/material.dart';

import '../../components/layouts/scaffold_page.dart';
import '../../core/constants.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {

    return ScaffoldPage(
      titlePage: "Mon profil",
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: padding * 2),
          child: const Center(
            child: Text('Tada'),
          )),
    );
  }
}
