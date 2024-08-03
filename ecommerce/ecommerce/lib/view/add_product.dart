import 'dart:io';

import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/data/product_list.dart';
import 'package:ecommerce/data/product_provider.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/widget/filed_button.dart';
import 'package:ecommerce/widget/input_field.dart';
import 'package:ecommerce/widget/red_outlined.dart';
import 'package:ecommerce/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String imagePath = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.item != null) {
      name.text = widget.item!.name;
      category.text = widget.item!.category as String;
      price.text = widget.item!.price.toString();
      description.text = widget.item!.description;
      imagePath = widget.item!.imagePath;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        imagePath = pickedFile.path;
      });
    } else {
      debugPrint('No image selected.');
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
                  child: Stack(
                    children: [
                      _image != null
                          ? Image.file(_image!)
                          : imagePath.isNotEmpty
                              ? Image.asset(imagePath)
                              : Center(
                                  child: Text("Upload Image"),
                                ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: IconButton(
                            onPressed: () => _pickImage(ImageSource.gallery),
                            icon: Image.asset(
                              'assets/images/image_icon.png',
                              width: 35,
                              height: 35,
                            )),
                      ),
                    ],
                  )),
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
                          print("delete");
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
      context.read<ProductProvider>().addProduct(widget.item!);
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
          imagePath: imagePath);

      context.read<ProductProvider>().updateProduct(widget!.item, product);
    } else {
      Product product = Product(
          name: name.text,
          category: category.text,
          size: int.parse(size.text),
          price: double.parse(price.text),
          description: description.text,
          imagePath: imagePath);
      context.read<ProductProvider>().addProduct(product);
    }
  }
}
