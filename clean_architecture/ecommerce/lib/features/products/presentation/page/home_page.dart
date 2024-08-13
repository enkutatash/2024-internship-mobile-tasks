import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_event.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_state.dart';
import 'package:ecommerce/features/products/presentation/widget/product_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomePageBloc>().add(FetchAllProducts());
    });
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  if (state.productEntity.isEmpty) {
                    if (state.status == HomePageStatus.loading) {
                      return const Center(child: CupertinoActivityIndicator());
                    } else if (state.status != HomePageStatus.success) {
                      return const Center(child: Text("Failed to load data"));
                    } else {
                      return const Center(
                          child: Text("No Product is available"));
                    }
                  }

                  return Expanded(
                    // height: height * 0.7,
                    child: ListView(
                      children: [
                        for (var product in state.productEntity)
                          ProductView(
                            product: product,
                          )
                        // Text(product.name)
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.purple,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: AppColors.white,
          size: 35,
        ),
      ),
    );
  }
}
