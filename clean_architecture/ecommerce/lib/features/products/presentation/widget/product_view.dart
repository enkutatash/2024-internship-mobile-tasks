import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/presentation/page/detail_product_page.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final ProductEntity product;
  const ProductView({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      item: product,
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColors.lightGrey,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        width: double.infinity,
        height: height * 0.26,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: height * 0.18,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8,
              ),
              child: Row(
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                children: [
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: AppColors.golden,
                  ),
                  Text(
                    "4.0",
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
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
