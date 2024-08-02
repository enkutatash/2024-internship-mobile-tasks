import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/data/product_list.dart';
import 'package:ecommerce/widget/product_view.dart';
import 'package:ecommerce/widget/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      const CustomText(
                        text: 'July 14, 2024',
                        fontSize: 12,
                        color: AppColors.textGrey,
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: 'Hello',
                            fontSize: 15,
                            color: AppColors.textGrey,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          const CustomText(
                            text: 'Yohannes',
                            fontSize: 15,
                            weight: FontWeight.w600,
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
                    child: Image.asset('assets/images/bell_icon.png'),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  const Text(
                    'Available Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: width * 0.11,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.03),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.search),
                      onPressed: () => context.go('/search'),
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
        onPressed: () => context.go('/add'),
        child: const Icon(
          Icons.add,
          color: AppColors.white,
          size: 35,
        ),
      ),
    );
  }
}
