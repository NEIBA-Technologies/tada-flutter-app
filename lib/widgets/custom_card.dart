import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final String leftSvgPath;
  final String? rightSvgPath; // Nullable
  final String? bottomText1; // Nullable
  final String? bottomText2; // Nullable
  final Color leftBackgroundColor;
  final double width;
  final double height;
  final double borderRadius;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    required this.leftSvgPath,
    this.rightSvgPath, // Nullable
    this.bottomText1, // Nullable
    this.bottomText2, // Nullable
    required this.leftBackgroundColor,
    this.width = 361,
    this.height = 105,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            children: [
              Container(
                width: 109,
                height: 105,
                color: leftBackgroundColor,
                child: Center(
                  child: SvgPicture.asset(
                    leftSvgPath,
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
              const SizedBox(width: 8.0), // Espacement entre les colonnes
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (rightSvgPath != null)
                          SvgPicture.asset(
                            rightSvgPath!,
                            height: 15,
                            width: 11.67,
                          ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        if (bottomText1 != null) ...[
                          Text(bottomText1!),
                          const SizedBox(width: 8.0),
                        ],
                        if (bottomText2 != null) ...[
                          Text(bottomText2!),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
