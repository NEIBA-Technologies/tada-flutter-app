import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/utils/helpers.dart';

class GridItem extends StatelessWidget {
  final String icon;
  final String text;
  final String routeNamed;

  const GridItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.routeNamed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeNamed);
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Helpers.getSvg(icon, color: blackColor,height: 23),
              const SizedBox(height: 11.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    text,
                    style: context.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}