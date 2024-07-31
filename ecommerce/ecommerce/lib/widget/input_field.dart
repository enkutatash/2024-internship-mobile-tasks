import 'package:ecommerce/data/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  double fieldHeight;
  String text;
  double fieldWidth;
  bool suffixicon;
  Color color;
  IconData? suffix;
  Color? iconColor;
  InputField(
      {this.fieldHeight = 0.05,
      this.suffixicon = false,
      this.text = "",
      this.color = AppColors.lightGrey,
      this.suffix = null,
      this.fieldWidth = double.infinity,
      this.iconColor = AppColors.purple,
      super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      width: fieldWidth,
      height: height * fieldHeight,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: TextField(
        controller: TextEditingController(text: text),
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: suffixicon
              ? Icon(
                  suffix,
                  color: iconColor,
                  size: 30,
                )
              : null,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 10,
      ),
    );
  }
}
