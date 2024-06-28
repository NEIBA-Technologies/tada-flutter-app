import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';

import '../components/layouts/default_page.dart';
import '../components/others_widget/app_buttom_widget.dart';
import '../components/others_widget/app_form_field.dart';
import '../components/others_widget/space_height_custom.dart';
import '../core/app_assets_link.dart';
import '../core/models/assignment.dart';
import '../core/router_generator.dart';
import '../core/utils/helpers.dart';

class InvinstigationScreen extends StatefulWidget {
  InvinstigationScreen({super.key, required this.data});

  Assignment? data;

  @override
  State<InvinstigationScreen> createState() => _InvinstigationScreenState();
}

class _InvinstigationScreenState extends State<InvinstigationScreen> {
  final TextEditingController _nameStoreController = TextEditingController(),
   _nameController = TextEditingController()
  ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultPage(
      titlePage: '${widget.data?.title}',
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             AppFormField(
                  label: 'Nom du magasin',
                  controller: _nameStoreController,
                  labelHint: "Nom du magasin",
                ),
                const SpaceHeightCustom(),
             AppFormField(
                  label: 'Nom du gérant',
                  controller: _nameController,
                  labelHint: "Nom du gérant",
                ),
                const SpaceHeightCustom(),
             AppFormField(
                  label: 'Contact du gérant',
                  controller: _nameController,
                  labelHint: "Contact du gérant",
                ),
                const SpaceHeightCustom(),
             AppFormField(
                  label: 'Type de magasin',
                  controller: _nameController,
                  labelHint: "Sélectionner le type de magasin",
                ),
                const SpaceHeightCustom(),
             AppFormField(
                  label: 'Photo de l’entrée',
                  controller: _nameController,
                  labelHint: "Prendre un photo",
                ),
                const SpaceHeightCustom(),
             AppFormField(
                  label: 'Méthodes de paiement disponible ',
                  controller: _nameController,
                  labelHint: "Sélectionner les méthodes",
                ),
                const SpaceHeightCustom(),
             AppFormField(
                  label: 'Catégories de produits en vente ',
                  controller: _nameController,
                  labelHint: "Sélectionner les produits",
                ),
          ],
       ),
      ),
      bottomsheet: AppButtonWidget(
          onPressed: () {
            // Navigator.pushNamed(
            //     context, RouterGenerator.signInRoute);
          },
          label: "Commencer"),
    );
  }
}
