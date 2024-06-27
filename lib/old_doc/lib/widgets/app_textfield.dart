import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final double? width;
  final double? height;

  const CustomTextField({
    super.key,
    required this.obscureText,
    this.width,
    this.height, 
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color(0xffB9BDC7),
                width: 0.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
