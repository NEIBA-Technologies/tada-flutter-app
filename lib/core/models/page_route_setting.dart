import 'package:tada/core/locator.dart';
import 'package:tada/core/navigation_service.dart';

class PageRouteSetting {
  final String title;
  final bool? isExternalLink;
  final String? externalLink;
  final String? routeName;
  final List<PageRouteSetting> children;

  PageRouteSetting({
    required this.title,
    this.isExternalLink = false,
    this.externalLink,
    this.children = const [],
    this.routeName,
  });

  onClick({dynamic args}) async {
    if (isExternalLink ?? false) {
      if (externalLink != null) {
        /// @Todo launchUrl('$externalLink!')
      }
    } else if (routeName != null) {
      locator<NavigationService>().navigateTo(routeName!, args: this);
    }
  }

  bool get checkIsExternalLink => isExternalLink ?? false;

  bool get hasRouteName => routeName != null;
}
