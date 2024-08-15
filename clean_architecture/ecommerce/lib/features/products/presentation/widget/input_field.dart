import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  TextEditingController controller;
  double fieldHeight;
  String text;
  double fieldWidth;
  bool suffixicon;
  Color color;
  IconData? suffix;
  String? hintText;
  Color? iconColor;
  final void Function(String)? onChange;
  TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  InputField(
      {this.fieldHeight = 0.05,
      required this.controller,
      this.suffixicon = false,
      this.text = '',
      this.color = AppColors.lightGrey,
      this.suffix,
      this.fieldWidth = double.infinity,
      this.iconColor = AppColors.purple,
      this.onChange,
      this.keyboardType = TextInputType.multiline,
      super.key,
      required this.validator,
      this.hintText});

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
        controller: controller,
        validator: validator,
        onChanged: onChange,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 15, color: AppColors.gray),
          hintText: hintText,
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
