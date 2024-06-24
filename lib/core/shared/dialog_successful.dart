import 'package:flutter/material.dart';
import 'package:tada/components/app_buttom_widget.dart';
import 'package:tada/core/app_assets_link.dart';
import 'package:tada/core/utils/helpers.dart';

import '../constants.dart';

class DialogSuccessful extends StatelessWidget {
  const DialogSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: indigoColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius * 2),
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(radius * 20),
            bottom: Radius.circular(radius * 2),
          ),
          color: pinkColor, // Couleur du contenu rose
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: padding * 3, horizontal: padding * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    top: -25,
                    left: -(size.width / 4),
                    child: Helpers.getSvg(
                        AppAssetLink.renderPraySorryGestureSvg,
                        height: size.width / 2,
                        color: primaryColor),
                  ),
                  Helpers.getImage(
                    AppAssetLink.gestureWithBlackHands,
                    height: size.width / 4,
                  )
                ],
              ),
              SizedBox(height: padding * 10),
              const Text(
                'FÉLICITATIONS !',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 3),
              Text(
                'Votre demande de messe est envoyée !',
                style: TextStyle(
                  color: lightndigoColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: padding * 3),
              AppButtonWidget(
                press: () {
                  Navigator.pop(context);
                },
                label: "En union de prières !",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
