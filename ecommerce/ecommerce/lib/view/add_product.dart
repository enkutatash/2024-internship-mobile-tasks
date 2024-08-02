import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/data/product_list.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/widget/filed_button.dart';
import 'package:ecommerce/widget/input_field.dart';
import 'package:ecommerce/widget/red_outlined.dart';
import 'package:ecommerce/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddProduct extends StatefulWidget {
  final Product? item;
  const AddProduct({this.item, super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController size = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.item != null) {
      name.text = widget.item!.name;
      category.text = widget.item!.category as String;
      price.text = widget.item!.price.toString();
      description.text = widget.item!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
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
          text: widget.item != null ? 'Edit Product' : 'Add Product',
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
                child: widget.item != null
                    ? Image.asset(widget.item!.imagePath)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/image_icon.png',
                                width: 35,
                                height: 35,
                              )),
                          const CustomText(
                            text: 'Upload image',
                          )
                        ],
                      ),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              const CustomText(text: 'name'),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                controller: name,
              ),
              SizedBox(
                height: height * 0.012,
              ),
              const CustomText(text: 'Catagory'),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                controller: category,
              ),
              const CustomText(text: 'Size'),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                controller: size,
              ),
              SizedBox(
                height: height * 0.012,
              ),
              const CustomText(text: 'Price'),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                controller: price,
                suffixicon: true,
                suffix: Icons.attach_money_sharp,
              ),
              SizedBox(
                height: height * 0.012,
              ),
              const CustomText(text: 'Description'),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                fieldHeight: 0.25,
                controller: description,
              ),
              SizedBox(
                height: height * 0.012,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15, top: 10),
                  child: FiledButton(
                    name: 'Add',
                    width: 1,
                    ontap: () {
                      _addProduct();
                      context.go('/home');
                    },
                  )),
              SizedBox(
                height: height * 0.012,
              ),
              widget.item != null
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                      child: RedOutlinedButton(
                        name: 'DELETE',
                        width: 1,
                        ontap: () {
                          _deleteProduct();
                          context.go('/home');
                        },
                      ))
                  : const SizedBox(),
            ],
          ),
        ),
      )),
    );
  }

  void _deleteProduct() {
    if (widget.item != null) {
      productList.remove(widget.item);
    }
  }

  void _addProduct() {
    if (widget.item != null) {
      Product product = Product(
          name: name.text,
          category: category.text,
          size: int.parse(size.text),
          price: double.parse(price.text),
          description: description.text,
          imagePath: widget.item!.imagePath);
      productList.remove(widget.item);
      productList.add(product);
    } else {
      Product product = Product(
          name: name.text,
          category: category.text,
          size: int.parse(size.text),
          price: double.parse(price.text),
          description: description.text,
          imagePath: 'assets/images/image_icon.png');
      productList.add(product);
    }
  }
}
