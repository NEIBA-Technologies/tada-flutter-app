import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  final List<BottomBarItem> items;
  final Function(int) onTap;
  final int currentIndex;

  const BottomBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          int index = items.indexOf(item);
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,  
              children: <Widget>[
                SvgPicture.asset(
                  item.iconPath,
                  color: index == currentIndex ? const Color(0xffFF5B4A) : const Color(0xff667085),
                  height: 24.0,
                  width: 24.0,
                ),
                const SizedBox(height: 4.0),
                Text(
                  item.label,
                  style: TextStyle(
                    color: index == currentIndex ? const Color(0xffFF5B4A) : const Color(0xff667085),
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BottomBarItem {
  final String iconPath;
  final String label;

  BottomBarItem({required this.iconPath, required this.label});
}
