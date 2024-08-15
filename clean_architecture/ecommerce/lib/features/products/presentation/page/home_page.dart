import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:ecommerce/features/products/presentation/page/add_product_page.dart';
import 'package:ecommerce/features/products/presentation/page/loading_page.dart';
import 'package:ecommerce/features/products/presentation/search_page/bloc/search_bloc.dart';
import 'package:ecommerce/features/products/presentation/widget/product_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<HomePageBloc>().add(FetchAllProducts());
    // });

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM dd,yyyy').format(now);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: width * 0.13,
                      height: height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.gray,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${formattedDate}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColors.textGrey),
                      ),
                      Row(
                        children: [
                          Text(
                            "Hello",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: AppColors.textGrey,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            "Yohannes",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Stack(children: [
                    Container(
                      width: width * 0.12,
                      height: height * 0.055,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                        border: Border.all(width: 0.05),
                      ),
                      // child: Image.asset("assets/images/bell_icon.png"),
                      child: Icon(
                        CupertinoIcons.bell,
                        color: AppColors.gray,
                      ),
                    ),
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.purple,
                        ),
                        width: 8,
                        height: 8,
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "Available Products",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: width * 0.12,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.03),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    ),
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.search),
                      onPressed: () {
                        Navigator.pushNamed(context, '/search');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<HomePageBloc>().add(FetchAllProducts());
                    
                  },
                  child: BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (context, state) {
                      if (state.status == HomePageStatus.loading) {
                        return LoadingPage();
                      } else if (state.status == HomePageStatus.failure) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Failed to load data"),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      } else if (state.products!.isEmpty) {
                        return const Center(
                            child: Text("No Product is available"));
                      }

                     
                      return ListView(
                        children: [
                          for (var product in state.products!)
                            ProductView(
                              product: product,
                            ),
                        ],
                      );
                    },
                  ),
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
          print("navigat");
          Navigator.pushNamed(context, '/add_product');
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
