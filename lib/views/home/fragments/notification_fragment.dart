import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../../components/layouts/scaffold_page.dart';
import '../../../components/others_widget/icon_close.dart';
import '../../../core/constants.dart';
import '../../../core/models/notification.dart';
import '../home_screen.dart';

class NotificationFragment extends StatefulWidget {
  const NotificationFragment({super.key});

  @override
  State<NotificationFragment> createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  final List<Notifications> notifications = [
    Notifications(
        title: 'Nouvelle mission disponible',
        description: 'Consultez et répondez à cette nouvelle mission',
        date: DateTime.now()),
    Notifications(
        title: 'Paiement effectué',
        description: 'Vous avez reçu un paiement de XOF 500',
        date: DateTime.now()),
    Notifications(
        title: 'Votre tâche  a été validée ',
        description: 'L’examen de votre mission est terminé',
        date: DateTime.now()),
    Notifications(
        title: 'Retrait effectué',
        description: 'Votre compte à été débité avec succès',
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: 'Notifications',
      actions: [
        IconClose(
          onPressed: () {
            navigationInHomeTo(PageViewIndex().home);
          },
        )
      ],
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: notifications.length,
          separatorBuilder: (context, index) =>
              Divider(height: 1, color: greyColor.shade100),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notifications[index].title,
                    style: context.titleSmall.copyWith(fontFamily: fontPrimary),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      notifications[index].description,
                      style: context.labelSmall,
                    ),
                  ),
                  Text(
                    notifications[index].date.hummanShortWithSplash(),
                    style: context.labelSmall.copyWith(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
