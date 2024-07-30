import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';

class Delete extends StatelessWidget {
  final String name;
  final double width;
  final double height;

  const Delete(
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
            child: Text(
          name,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.red),
        )),
      ),
    );
  }
}

class Update extends StatelessWidget {
  final double width;
  final double height;
  final String name;

  const Update(
      {required this.name, this.width = 0.37, this.height = 0.06, super.key});

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.purple),
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(10)),
        width: widthMedia * width,
        height: heightMedia * height,
        child: Center(
            child: Text(
          name,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        )),
      ),
    );
  }
}
