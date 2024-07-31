import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/widget/filed_button.dart';
import 'package:ecommerce/widget/input_field.dart';
import 'package:ecommerce/widget/red_outlined.dart';
import 'package:ecommerce/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddProduct extends StatelessWidget {
  final Product? item;
  const AddProduct({this.item, super.key});

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
        title: CustomText(
          text: item != null ? "Edit Product" : "Add Product",
          fontSize: 16,
        ),
        centerTitle: true,
      ),
      body: Form(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.lightGrey),
                child: item != null
                    ? Image.asset(item!.imagePath)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/image_icon.png",
                                width: 35,
                                height: 35,
                              )),
                          CustomText(
                            text: "Upload image",
                          )
                        ],
                      ),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              CustomText(text: "name"),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                text: item != null ? item!.name : "",
              ),
              SizedBox(
                height: height * 0.012,
              ),
              CustomText(text: "Catagory"),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                text: item != null ? item!.category.toString() : "",
              ),
              SizedBox(
                height: height * 0.012,
              ),
              CustomText(text: "Price"),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                text: item != null ? item!.price.toString() : "",
                suffixicon: true,
                suffix: Icons.attach_money_sharp,
              ),
              SizedBox(
                height: height * 0.012,
              ),
              CustomText(text: "Description"),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                fieldHeight: 0.25,
                text: item != null ? item!.description.toString() : "",
              ),
              SizedBox(
                height: height * 0.012,
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15, top: 10),
                  child: FiledButton(
                    name: "Add",
                    width: 1,
                  )),
              SizedBox(
                height: height * 0.012,
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15, top: 10),
                  child: RedOutlinedButton(
                    name: "DELETE",
                    width: 1,
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
