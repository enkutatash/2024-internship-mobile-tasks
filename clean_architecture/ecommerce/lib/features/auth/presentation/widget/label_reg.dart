import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelReg extends StatelessWidget {
  String text;
  LabelReg({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
          fontSize: 15,
          color: AppColors.labelColor,
        ));
  }
}
