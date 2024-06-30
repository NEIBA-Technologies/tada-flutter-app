import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/core/constants.dart';

import '../../components/others_widget/app_buttom_widget.dart';
import '../../components/others_widget/app_form_field.dart';
import '../../components/others_widget/space_custom.dart';
import '../../core/models/assignment.dart';

class InvinstigationScreen extends StatefulWidget {
  InvinstigationScreen({super.key, required this.data});

  Assignment? data;

  @override
  State<InvinstigationScreen> createState() => _InvinstigationScreenState();
}

class _InvinstigationScreenState extends State<InvinstigationScreen> {
  final TextEditingController _nameStoreController = TextEditingController(),
      _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: '${widget.data?.title}',
      color: Colors.white,
      canBack: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppFormField(
              label: 'Nom du magasin',
              labelBold: true,
              controller: _nameStoreController,
              labelHint: "Nom du magasin",
            ),
            const SpaceHeightCustom(),
            AppFormField(
              label: 'Nom du gérant',
              labelBold: true,
              controller: _nameController,
              labelHint: "Nom du gérant",
            ),
            const SpaceHeightCustom(),
            AppFormField(
              labelBold: true,
              label: 'Contact du gérant',
              controller: _nameController,
              labelHint: "Contact du gérant",
            ),
            const SpaceHeightCustom(),
            AppFormField(
              labelBold: true,
              label: 'Type de magasin',
              controller: _nameController,
              labelHint: "Sélectionner le type de magasin",
            ),
            const SpaceHeightCustom(),
            AppFormField(
              labelBold: true,
              label: 'Photo de l’entrée',
              controller: _nameController,
              labelHint: "Prendre un photo",
            ),
            const SpaceHeightCustom(),
            AppFormField(
              label: 'Méthodes de paiement disponible ',
              controller: _nameController,
              labelBold: true,
              labelHint: "Sélectionner les méthodes",
            ),
            const SpaceHeightCustom(),
            AppFormField(
              labelBold: true,
              label: 'Catégories de produits en vente ',
              controller: _nameController,
              labelHint: "Sélectionner les produits",
            ),
            const SpaceHeightCustom(),
            AppFormField(
              labelBold: true,
              label: 'Catégories de produits en vente ',
              controller: _nameController,
              labelHint: "Sélectionner les produits",
            ),
          ],
        ),
      ),
      bottomsheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonWidget(onPressed: () {}, label: "Commencer"),
      ),
    );
  }
}
