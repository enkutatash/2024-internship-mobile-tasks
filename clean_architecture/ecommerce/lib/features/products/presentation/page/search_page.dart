import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:ecommerce/features/products/presentation/page/loading_page.dart';
import 'package:ecommerce/features/products/presentation/search_page/bloc/search_bloc.dart';
import 'package:ecommerce/features/products/presentation/widget/filter.dart';
import 'package:ecommerce/features/products/presentation/widget/product_view.dart';
import 'package:ecommerce/features/products/presentation/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var home = BlocProvider.of<HomePageBloc>(context).state.products!;

      context.read<SearchBloc>().add(IntialFetch(products: home));
    });

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
            ),
          ),
          title: Text("Search Product"),
          centerTitle: true,
        ),
        body: Container(
            height: height * 0.9,
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  SearchField(
                    onChange: (search) => context
                        .read<SearchBloc>()
                        .add(SearchTextChange(search: search)),
                  ),
                  SizedBox(
                    width: 10,
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
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
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
                        for (var product in state.filteredProducts)
                          ProductView(
                            product: product,
                          ),
                      ],
                    );
                  },
                ),
              )
            ])));
  }
}
