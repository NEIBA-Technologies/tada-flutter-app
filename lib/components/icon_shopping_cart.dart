import 'package:flutter/material.dart';

import '../../core/constants.dart';

class IconShoppingCart extends StatelessWidget {
  final count = shoppingItemList.length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        Positioned(
          left: -5,
          top: 25,
          child: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 8,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: Text(
                "$count",
                key: ValueKey('$count'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
