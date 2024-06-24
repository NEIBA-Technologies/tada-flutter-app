import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/loading_indicator.dart';
import '../app_assets_link.dart';

class Helpers {
  static Image getImage(
    String assetLink, {
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.asset(
      assetLink,
      width: width,
      height: height ?? width,
      alignment: Alignment.center,
      repeat: ImageRepeat.noRepeat,
      fit: fit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const FittedBox();
      },
    );
  }

  static SvgPicture getSvg(
    assetLink, {
    double? width = 16,
    double? height = 16,
    Color? color,
    BoxFit? fit,
  }) {
    return SvgPicture.asset(
      assetLink,
      color: color,
      width: width,
      height: height ?? width,
      fit: fit ?? BoxFit.cover,
      placeholderBuilder: (context) {
        return SvgPicture.asset(
          AppAssetLink.logoSvg,
          width: 16,
          height: 16,
        );
      },
    );
  }

  static Image getImageNetWork(String? link, {double? height, double? width}) {
    return Image(
      alignment: Alignment.center,
      fit: BoxFit.contain,
      repeat: ImageRepeat.noRepeat,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(child: LoadingIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return FittedBox(
          alignment: Alignment.center,
          child: getImage(AppAssetLink.logoSvg),
        );
      },
      image: NetworkImage("$link"),
    );
  }
}
