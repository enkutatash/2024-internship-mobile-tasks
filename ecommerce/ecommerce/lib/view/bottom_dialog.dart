import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/widget/filed_button.dart';
import 'package:ecommerce/widget/input_field.dart';
import 'package:ecommerce/widget/range_slider.dart';
import 'package:flutter/material.dart';

class BottomDialog extends StatelessWidget {
  const BottomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000).withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 15,
          offset: const Offset(0, 5),
        )
      ]),
      width: double.infinity,
      height: height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Category',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          // SearchField(
          //   fieldWidth: 0.85,
          // ),
          InputField(),
          SizedBox(
            height: height * 0.02,
          ),
          const RangeSliderView(),
          SizedBox(
            height: height * 0.02,
          ),
          const FiledButton(
            name: 'APPLY',
            width: 0.85,
          )
        ],
      ),
    );
  }
}
