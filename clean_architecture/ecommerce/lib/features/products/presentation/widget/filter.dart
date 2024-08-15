import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/presentation/page/add_product_page.dart';
import 'package:ecommerce/features/products/presentation/search_page/bloc/search_bloc.dart';
import 'package:ecommerce/features/products/presentation/widget/button_fields.dart';
import 'package:ecommerce/features/products/presentation/widget/range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              "Price",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          RangeSliderView(),
          SizedBox(
            height: height * 0.02,
          ),
          FiledButton(
            name: "APPLY",
            width: 0.85,
            ontap: () {
              context.read<SearchBloc>().add(ApplyFilter());
              Navigator.pushNamed(context, '/search');
              // Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
