import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/widget/text.dart';
import 'package:flutter/material.dart';

class FiledButton extends StatelessWidget {
  final double width;
  final double height;
  final String name;
  final VoidCallback? ontap;

  const FiledButton({
    required this.name,
    this.width = 0.37,
    this.height = 0.06,
    this.ontap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.purple),
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(10)),
        width: widthMedia * width,
        height: heightMedia * height,
        child: Center(
            child: CustomText(
          text: name,
          weight: FontWeight.w600,
          color: AppColors.white,
        )),
      ),
    );
  }
}
