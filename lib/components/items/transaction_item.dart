import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../core/models/transaction.dart';
import '../others_widget/space_custom.dart';

class TransactionItem extends StatelessWidget {
  final Transaction data;

  const TransactionItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data.title, style: context.titleSmall),
            Text(
              "${data.income ? "+" : "-"}${data.amount} XOF",
              style: context.titleSmall
                  .copyWith(color: data.income ? Colors.green : Colors.red),
            ),
          ],
        ),
        const SpaceHeightCustom(),
        Text("${data.descitpion} • ${data.date.hummanShortWithSplash()}",
            style: context.labelMedium),
      ],
    );
  }
}
