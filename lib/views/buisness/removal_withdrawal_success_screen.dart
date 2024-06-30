import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/router_generator.dart';

import '../../components/params/router_arguments.dart';

class RemovalWithdrawalSuccessScreen extends StatefulWidget {
  const RemovalWithdrawalSuccessScreen({super.key});

  @override
  State<RemovalWithdrawalSuccessScreen> createState() =>
      _RemovalWithdrawalSuccessScreenState();
}

class _RemovalWithdrawalSuccessScreenState
    extends State<RemovalWithdrawalSuccessScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouterGenerator.indexRoute, (route) => false,
          arguments: RouterArguments(fragmentTarget: FragmentTarget.BUSINESS));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.width / 5,
                margin: const EdgeInsets.only(bottom: 30),
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  backgroundColor: Colors.black12,
                  color: primaryColor,
                ),
              ),
              Text(
                "Demande soumise avec succès",
                textAlign: TextAlign.center,
                style: context.labelLarge.copyWith(
                  color: primaryColor,
                ),
              ),
              const SpaceHeightCustom(),
              Text(
                "Vous avez retirer XOF 5000 ${DateTime.now().hummanShortWithSplash()}",
                textAlign: TextAlign.center,
                style: context.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
