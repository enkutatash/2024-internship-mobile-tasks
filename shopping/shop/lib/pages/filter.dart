import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';
import 'package:shop/pages/button_views.dart';
import 'package:shop/pages/range_slider.dart';
import 'package:shop/pages/search_bar.dart';
import 'package:shop/pages/textfield.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
          color: const Color(0xFF000000)
              .withOpacity(0.5), // Semi-transparent black
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Category",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          SearchField(
            fieldWidth: 0.85,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          RangeSliderView(),
          SizedBox(
            height: height * 0.02,
          ),
          Update(
            name: "APPLY",
            width: 0.85,
          )
        ],
      ),
    );
  }
}
