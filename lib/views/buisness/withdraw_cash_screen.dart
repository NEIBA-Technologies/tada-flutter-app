import 'package:flutter/material.dart';
import 'package:tada/components/items/row_item_account.dart';
import 'package:tada/components/others_widget/space_height_custom.dart';
import 'package:tada/core/app_assets_link.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/utils/helpers.dart';

import '../../components/layouts/scaffold_page.dart';
import '../../components/others_widget/app_buttom_widget.dart';
import '../../core/models/account_transaction.dart';

class WithdrawCashScreen extends StatefulWidget {
  const WithdrawCashScreen({super.key});

  @override
  State<WithdrawCashScreen> createState() => _WithdrawCashScreenState();
}

class _WithdrawCashScreenState extends State<WithdrawCashScreen> {
  List<AccountTransaction> accounts = [
    AccountTransaction(title: "MoMo", phone: "0502030456"),
    AccountTransaction(title: 'Orange money', phone: "0702030456"),
  ];

  AccountTransaction? selectedItem;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: "Retirer de l’argent",
      canBack: true,
      bottomsheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonWidget(onPressed: () {}, label: "Commencer"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Helpers.getSvg(AppAssetLink.smartPhoneIconSvg,
                    color: primaryColor, height: 30),
                const SpaceHeightCustom(),
                Text(
                  'Solde XOF ${15000.simpleCurrency(decimalDigits: 1)}',
                  style: context.titleLarge,
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: Colors.black12,
                  color: primaryColor,
                  value: .5,
                ),
                const SpaceHeightCustom(),
                Text(
                    'Retrait minimum de ${3000.formatCurrency(decimalDigits: 0, locale: 'fr', symbol: 'F CFA')}',
                    style: context.labelSmall),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sélectionner un compte', style: context.labelLarge),
                const SpaceHeightCustom(),
                ...accounts.map(
                  (el) => GestureDetector(
                      onTap: () {
                        selectedItem = el;
                        setState(() {});
                      },
                      child: RowItemAccount(
                        title: el.title,
                        subtitle: el.phone,
                        isSelected: el.phone.toString() == selectedItem?.phone.toString(),
                      )),
                )
              ],
            ),

            /* Center(
              child: ContinuingButton(
                width: 321,
                height: 48,
                text: 'Envoyer',
                fontSize: 16,
                borderRadius: 8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PortefeuilRetrait2()),
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
