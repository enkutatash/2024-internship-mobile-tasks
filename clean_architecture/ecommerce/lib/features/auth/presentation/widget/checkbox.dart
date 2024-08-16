import 'package:ecommerce/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        GestureDetector(
          onTap: () => onChanged(!value),
          child: RichText(
            text: TextSpan(
              text: 'I understood the ',
              style: GoogleFonts.poppins(
                color: AppColors.textGrey2,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'terms & policy.',
                  style: GoogleFonts.poppins(
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
