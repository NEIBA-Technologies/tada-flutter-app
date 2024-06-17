import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tada/bloc/hovering/hovering_bloc.dart';
import 'package:tada/bloc/hovering/hovering_event.dart';
import 'package:tada/bloc/hovering/hovering_state.dart';


class ContinuingButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double fontSize;
  final double borderRadius;
  final void Function()? onPressed;

  const ContinuingButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.fontSize,
    required this.borderRadius,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HoveringBloc(),
      child: BlocBuilder<HoveringBloc, HoveringState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              context.read<HoveringBloc>().add(HoveringClicked());
              if (onPressed != null) {
                onPressed!();
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(width, height), // Taille minimale du bouton
              fixedSize: Size(width, height), // Taille fixe du bouton
              backgroundColor: state.isClicked ? const Color(0xffE85343): const Color(0xffFF5B4A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: state.isClicked
                    ? const BorderSide(color: Color(0xffB54135), width: 2.0)
                    : BorderSide.none,
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontFamily: 'SoraR',
              ),
            ),
          );
        },
      ),
    );
  }
}
