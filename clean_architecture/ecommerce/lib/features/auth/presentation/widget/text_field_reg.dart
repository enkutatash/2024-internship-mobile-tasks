import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextFieldReg extends StatelessWidget {
  final void Function(String)? onChange;
  String hintText;
  TextFieldReg({required this.hintText, this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      width: double.infinity,
      height: height * 0.055,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.lightGrey),
      child: TextFormField(
        onChanged: onChange,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 15, color: AppColors.gray),
          hintText: hintText,
          border: InputBorder.none,
        ),
        maxLines: 1,
      ),
    );
  }
}
