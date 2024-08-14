import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:ecommerce/features/products/presentation/widget/button_fields.dart';
import 'package:ecommerce/features/products/presentation/widget/red_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  final ProductEntity item;
  const ProductDetail({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  item.imageUrl,
                  width: double.infinity,
                  height: height * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: Image.asset('assets/images/back_arrow_icon.png'),
                    onPressed: () => Navigator.pop(context),
                  )),
            ]),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: AppColors.golden,
                  ),
                  Text(
                    '(4.5)',
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${item.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: Text(
                  item.description,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGrey2),
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  RedOutlinedButton(
                    name: 'DELETE',
                    ontap: () {
                      context
                          .read<HomePageBloc>()
                          .add(DeleteProduct(id:item.id));
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  const Spacer(),
                  FiledButton(
                    name: 'UPDATE',
                    ontap: () {
                      Navigator.pushNamed(
                        context,
                        '/update',
                        arguments: item,
                      );
                      
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
