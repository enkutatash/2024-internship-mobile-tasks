import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Logo extends StatelessWidget {
  double boxWidth;
  double boxHeight;
  Logo({this.boxWidth = 0.18, this.boxHeight = 0.05, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * boxHeight,
      width: width * boxWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.purple, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray,
              // spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
              blurStyle: BlurStyle.outer,
            ),
          ]),
      child: Center(
        child: Text(
          "ECOM",
          style: GoogleFonts.caveatBrush(
              color: AppColors.purple,
              fontSize: 30,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
