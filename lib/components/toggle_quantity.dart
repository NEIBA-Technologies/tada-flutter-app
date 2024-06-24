import 'package:flutter/material.dart';

class ToggleQuantity extends StatelessWidget {
  final Function onRemove;
  final Function onAdd;
  final int value;

  const ToggleQuantity(
      {super.key,
      required this.onRemove,
      required this.onAdd,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            onRemove();
            // cubit.removeQuantity(productId);
          },
          child: CircleAvatar(
            backgroundColor: value > 0 ? Colors.black : Colors.black12,
            radius: 12,
            child: const Icon(
              Icons.remove,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: Text(
              "$value",
              key: ValueKey("$value"),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onAdd();
          },
          child: CircleAvatar(
            backgroundColor: value > 0 ? Colors.black : Colors.black12,
            radius: 12,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
