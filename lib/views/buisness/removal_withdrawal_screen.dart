import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/router_generator.dart';

import '../../components/layouts/scaffold_page.dart';
import '../../components/others_widget/app_buttom_widget.dart';
import '../../core/formaters/formater_input.dart';

class RemovalWithdrawalScreen extends StatefulWidget {
  const RemovalWithdrawalScreen({super.key});

  @override
  State<RemovalWithdrawalScreen> createState() =>
      _RemovalWithdrawalScreenState();
}

class _RemovalWithdrawalScreenState extends State<RemovalWithdrawalScreen> {
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: "Montant",
      canBack: true,
      bottomsheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonWidget(
            onPressed: () {
              Navigator.pushNamed(
                  context, RouterGenerator.removalWithdrawalSuccessRoute);
            },
            label: "Commencer"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Solde',
                textAlign: TextAlign.start,
                style: context.labelLarge,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "XOF ${15000.formatCurrency()}",
                style: context.titleLarge.copyWith(color: primaryColor),
              ),
            ),
            const SpaceHeightCustom(),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Retrait minimum - ${5000.formatCurrency(decimalDigits: 0, locale: 'fr', symbol: 'F CFA')}',
                  style: context.labelSmall),
            ),
            const SpaceHeightCustom(breakPoint: BreakPoint.xxl),
            Container(
              width: MediaQuery.of(context).size.width / 1.7,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('XOF',
                      textAlign: TextAlign.end, style: context.titleLarge),
                  const SizedBox(width: 5),
                  Expanded(
                    child: EditableText(
                      controller: _amountController,
                      focusNode: FocusNode(),
                      autofocus: true,
                      minLines: 1,
                      textAlign: TextAlign.start,
                      inputFormatters: [FormateAmountCurrency()],
                      keyboardType: TextInputType.number,
                      style: context.titleLarge,
                      cursorColor: blackColor,
                      backgroundCursorColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
