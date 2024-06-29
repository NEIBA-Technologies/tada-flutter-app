import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/components/others_widget/app_buttom_widget.dart';
import 'package:tada/components/others_widget/hero_logo.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/router_generator.dart';

import '../../components/items/transaction_item.dart';
import '../../components/others_widget/space_custom.dart';
import '../../core/app_assets_link.dart';
import '../../core/constants.dart';
import '../../core/models/transaction.dart';
import '../../core/utils/helpers.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  final List<Transaction> transactions = [
    Transaction(
      title: 'Enquête cliblées',
      amount: '1500',
      descitpion: 'Mission payé',
      date: DateTime.now(),
      income: true,
    ),
    Transaction(
      title: 'Retrait d’argent',
      amount: '5000',
      income: false,
      descitpion: 'Retrait validé',
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Enquête cliblées',
      amount: '1500',
      descitpion: 'Mission payé',
      date: DateTime.now(),
      income: true,
    ),
    Transaction(
      title: 'Retrait d’argent',
      amount: '5000',
      income: false,
      descitpion: 'Retrait validé',
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Enquête cliblées',
      amount: '1500',
      descitpion: 'Mission payé',
      date: DateTime.now(),
      income: true,
    ),
    Transaction(
      title: 'Retrait d’argent',
      amount: '5000',
      income: false,
      descitpion: 'Retrait validé',
      date: DateTime.now(),
    ),
    Transaction(
      title: 'Enquête cliblées',
      amount: '1500',
      descitpion: 'Mission payé',
      date: DateTime.now(),
      income: true,
    ),
    Transaction(
      title: 'Retrait d’argent',
      amount: '5000',
      income: false,
      descitpion: 'Retrait validé',
      date: DateTime.now(),
    ),
    // Ajoutez d'autres transactions ici
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: 'Mon portefeuille',
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: yellowColor,
                child: Padding(
                  padding: EdgeInsets.all(padding * 1.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Argent encaissé',
                        style: context.titleSmall,
                      ),
                      Text(
                        'XOF ${15000.simpleCurrency()}',
                        style: context.labelLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const SpaceHeightCustom(),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Solde XOF ${15000.simpleCurrency(decimalDigits: 1)}',
                            style: context.titleLarge,
                          ),
                          const HeroLogo(size: 25)
                        ],
                      ),
                      const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                      Text('Encore XOF 3500 avant de retirer',
                          style: context.labelMedium),
                      const SpaceHeightCustom(),
                      AppButtonWidget(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouterGenerator.withdrawCashRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SpaceHeightCustom(),
              Card(
                margin: EdgeInsets.zero,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      // top: padding * 1.2,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: padding * 4.3),
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(8)),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: padding)
                            .copyWith(top: padding * 1.2, bottom: padding),
                        child: ListView.separated(
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            return TransactionItem(data: transactions[index]);
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(color: greyColor.shade100, height: 20),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.zero,
                        elevation: 15,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(padding),
                          child: Text(
                            'Transactions',
                            style: context.labelLarge,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      child: Helpers.getSvg(AppAssetLink.smartPhoneIconSvg,
                          color: primaryColor, height: 30),
                    ),
                    const SpaceWidthCustom(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ajouter un compte mobile monney',
                            textAlign: TextAlign.start,
                            style: context.labelLarge,
                          ),
                          const SpaceHeightCustom(),
                          Text(
                            "Enregistrez un compte pour faire vos retaits d'argent",
                            textAlign: TextAlign.start,
                            style: context.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
