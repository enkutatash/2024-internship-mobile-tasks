import 'package:ecommerce/data/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  double fieldHeight;
  String text;
  double fieldWidth;
  bool suffixicon;
  Color color;
  IconData? suffix;
  Color? iconColor;
  TextEditingController? controller;
  TextInputType? keyboardType;
  InputField(
      {this.fieldHeight = 0.05,
      this.suffixicon = false,
      this.text = '',
      this.color = AppColors.lightGrey,
      this.suffix,
      this.fieldWidth = double.infinity,
      this.iconColor = AppColors.purple,
      this.controller,
      this.keyboardType = TextInputType.multiline,
      super.key});

  @override
  Widget build(BuildContext context) {
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
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        controller: controller,
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
        keyboardType: keyboardType,
        maxLines: 10,
      ),
    );
  }
}
