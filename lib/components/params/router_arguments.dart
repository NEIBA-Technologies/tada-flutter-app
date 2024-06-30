import '../../core/models/page_route_setting.dart';
import '../../core/router_generator.dart';

enum FragmentTarget {
  HOME,
  TASK,
  BUSINESS,
  ACCOUNT,
}

class RouterArguments {
  final FragmentTarget? fragmentTarget;

  RouterArguments({this.fragmentTarget});
}

class ArgumentAccountPages {
  get supportAndContact => PageRouteSetting(
        title: 'Support & Contact',
        children: [
          PageRouteSetting(
            title: "Signaler un problème au service client",
            routeName: RouterGenerator.reportProblemRoute,
          ),
          PageRouteSetting(
            title: "Introduction à Tada",
            routeName: RouterGenerator.reportProblemRoute,
            children: [
              PageRouteSetting(
                title: "Quelles sont les méthodes de paiement disponible",
                routeName: RouterGenerator.displayContentRoute,
              ),
              PageRouteSetting(
                title: "Quelles sont les méthodes de paiement disponible",
                routeName: RouterGenerator.displayContentRoute,
              ),
              PageRouteSetting(
                title: "Quelles sont les méthodes de paiement disponible",
                routeName: RouterGenerator.displayContentRoute,
              ),
              PageRouteSetting(
                title: "Quelles sont les méthodes de paiement disponible",
                routeName: RouterGenerator.displayContentRoute,
              ),
              PageRouteSetting(
                title: "Quelles sont les méthodes de paiement disponible",
                routeName: RouterGenerator.displayContentRoute,
              ),
            ],
          )
        ],
      );

  get about => PageRouteSetting(
        title: 'À propos',
        children: [
          PageRouteSetting(
            title: "Conditions d’utilisation",
            routeName: RouterGenerator.displayContentRoute,
          ),
          PageRouteSetting(
            title: "Politique de confidentialité",
            routeName: RouterGenerator.displayContentRoute,
          )
        ],
      );

  get socialNetwork => PageRouteSetting(
        title: 'Rejoindre la communauté',
        children: [
          PageRouteSetting(
            title: "Intégrer notre communauté Telegram",
            isExternalLink: true,
          ),
          PageRouteSetting(
            title: "S’abonner à nos actualités sur Facebook",
            isExternalLink: true,
          )
        ],
      );
}
