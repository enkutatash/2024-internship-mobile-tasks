import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';
import 'package:shop/const/data.dart';
import 'package:shop/pages/filter.dart';
import 'package:shop/pages/product_view.dart';
import 'package:shop/pages/search_bar.dart';

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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppColors.purple,
            )),
        title: Text("Search Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SearchField(),
                  SizedBox(
                    width: width * 0.02,
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
                      icon: Icon(
                        Icons.filter_list,
                        size: 25,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context, builder: (context) => Filter());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.8,
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
    );
  }
}
