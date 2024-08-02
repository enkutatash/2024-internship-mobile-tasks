import 'package:ecommerce/data/colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color color;

  const CustomText({
    required this.text,
    this.fontSize = 14,
    this.weight = FontWeight.w500,
    this.color = AppColors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
