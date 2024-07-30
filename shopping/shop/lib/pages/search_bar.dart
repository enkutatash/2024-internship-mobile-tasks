import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';

class SearchField extends StatelessWidget {
  final double fieldHeight;
  final double fieldWidth;
  final bool suffixIcon;

  SearchField({
    this.fieldHeight = 0.05,
    this.fieldWidth = 0.73,
    this.suffixIcon = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.only(
        left: 13,
        right: 10,
      ),
      width: width * fieldWidth,
      height: height * fieldHeight,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.gray),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: suffixIcon
              ? Icon(
                  Icons.arrow_forward,
                  color: AppColors.purple,
                )
              : null,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 10,
      ),
    );
  }
}
