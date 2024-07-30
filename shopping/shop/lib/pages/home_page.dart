import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';
import 'package:shop/const/data.dart';
import 'package:shop/pages/add_product.dart';
import 'package:shop/pages/product_view.dart';
import 'package:shop/pages/search.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: width * 0.13,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.gray,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "July 14, 2024",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColors.textGrey),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Hello",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: AppColors.textGrey),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          const Text(
                            "Yohannes",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: width * 0.11,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                      border: Border.all(width: 0.03),
                    ),
                    child: Image.asset("assets/images/bell_icon.png"),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  const Text(
                    "Available Products",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: width * 0.11,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.03),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    ),
                    child: IconButton(
                      icon: Icon(CupertinoIcons.search),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return ProductView(item: productList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.purple,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProduct()));
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
          size: 35,
        ),
      ),
    );
  }
}
