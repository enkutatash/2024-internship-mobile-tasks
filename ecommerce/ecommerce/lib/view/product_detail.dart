import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/data/product_list.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/widget/filed_button.dart';
import 'package:ecommerce/widget/red_outlined.dart';
import 'package:ecommerce/widget/size_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetail extends StatelessWidget {
  final Product item;
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
                child: Image.asset(
                  item.imagePath,
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
                    onPressed: () => context.go('/home'),
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    '${item.category}',
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: AppColors.golden,
                  ),
                  Text(
                    '(${item.star})',
                    style: const TextStyle(
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
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Size: ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
              child: SizeView(selectedSize: item.size),
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
                      productList.remove(item);
                      context.go('/home');
                      debugPrint("${item!.name} has removed");
                    },
                  ),
                  const Spacer(),
                  FiledButton(
                    name: 'UPDATE',
                    ontap: () => context.go('/update', extra: item),
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
