import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/widget/text.dart';
import 'package:flutter/material.dart';

class RedOutlinedButton extends StatelessWidget {
  final String name;
  final double width;
  final double height;

  const RedOutlinedButton(
      {required this.name, this.width = 0.37, this.height = 0.06, super.key});

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.red),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        width: widthMedia * width,
        height: heightMedia * height,
        child: Center(
            child: CustomText(
          text: name,
          color: AppColors.red,
          weight: FontWeight.w600,
        )),
      ),
    );
  }
}
