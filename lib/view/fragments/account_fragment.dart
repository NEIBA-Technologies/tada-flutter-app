import 'package:flutter/material.dart';

import '../../components/layouts/scaffold_page.dart';
import '../../core/constants.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment({super.key});

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
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
