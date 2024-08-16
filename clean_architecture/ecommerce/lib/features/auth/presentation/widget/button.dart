import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/presentation/widget/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonReg extends StatelessWidget {
  final double width;
  final double height;
  final String name;
  final VoidCallback? ontap;

  const ButtonReg({
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
            child: Text(
          name,
          style: GoogleFonts.poppins(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18),
        )),
      ),
    );
  }
}
