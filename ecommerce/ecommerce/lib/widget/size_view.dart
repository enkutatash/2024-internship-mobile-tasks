import 'package:ecommerce/data/colors.dart';
import 'package:flutter/material.dart';

class SizeView extends StatelessWidget {
  int selectedSize;
  SizeView({required this.selectedSize, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(5),
      height: height * 0.08,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sizeList.length,
          itemBuilder: (context, index) {
            return Container(
              width: width * 0.13,
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedSize == sizeList[index]
                      ? AppColors.purple
                      : AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.gray,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Center(
                child: Text(
                  "${sizeList[index]}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: selectedSize == sizeList[index]
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

List<int> sizeList = [39, 40, 41, 42, 43, 44];
