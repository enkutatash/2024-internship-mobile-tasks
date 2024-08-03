import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/data/product_list.dart';
import 'package:ecommerce/data/product_provider.dart';
import 'package:ecommerce/view/bottom_dialog.dart';
import 'package:ecommerce/widget/input_field.dart';
import 'package:ecommerce/widget/product_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: IconButton(
              onPressed: () => context.go('/home'),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColors.purple,
              )),
          title: const Text('Search Product'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InputField(
                      fieldWidth: width * 0.76,
                      suffixicon: true,
                      suffix: Icons.arrow_forward_outlined,
                    ),
                    Container(
                      width: width * 0.12,
                      height: height * 0.055,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.03),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.purple,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.filter_list,
                          size: 25,
                          color: AppColors.white,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const BottomDialog());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.8,
                  child: ListView.builder(
                    itemCount:
                        context.watch<ProductProvider>().productList.length,
                    itemBuilder: (context, index) {
                      return ProductView(
                          item: context
                              .watch<ProductProvider>()
                              .productList[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
