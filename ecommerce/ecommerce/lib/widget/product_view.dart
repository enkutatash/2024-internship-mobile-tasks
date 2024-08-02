import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductView extends StatelessWidget {
  final Product item;
  const ProductView({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => context.go('/detail', extra: item),
      child: Container(
        margin:const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow:const [
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
              child: Image.asset(
                item.imagePath,
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
                    item.name,
                    style:const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$${item.price}',
                    style:const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                children: [
                  Text(
                    '${item.category}',
                    style:const TextStyle(
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                 const Icon(
                    Icons.star,
                    color: AppColors.golden,
                  ),
                  Text(
                    '(${item.star})',
                    style:const TextStyle(
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
