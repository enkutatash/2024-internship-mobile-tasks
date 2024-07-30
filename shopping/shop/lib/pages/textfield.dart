import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';

class Textfield extends StatelessWidget {
  double fieldHeight;
  Textfield({this.fieldHeight = 0.05, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      width: double.infinity,
      height: height * fieldHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.gray),
      child: const TextField(
        decoration: InputDecoration(border: InputBorder.none),
        keyboardType: TextInputType.multiline,
        maxLines: 10,
      ),
    );
  }
}

class FieldDesc extends StatelessWidget {
  const FieldDesc(this.fieldName, {super.key});
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, top: 8, bottom: 8),
      child: Text(
        fieldName,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
