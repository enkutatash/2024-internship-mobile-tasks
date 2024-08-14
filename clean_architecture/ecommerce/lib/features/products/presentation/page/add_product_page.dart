import 'dart:io';

import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/presentation/widget/button_fields.dart';
import 'package:ecommerce/features/products/presentation/widget/input_field.dart';
import 'package:ecommerce/features/products/presentation/widget/red_button.dart';
import 'package:ecommerce/features/products/presentation/widget/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
 final ProductEntity? item;
  const AddProductPage({this.item, super.key});
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
 
  TextEditingController name = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController size = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String imagePath = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.item != null) {
      name.text = widget.item!.name;
      price.text = widget.item!.price.toString();
      description.text = widget.item!.description;
      imagePath = widget.item!.imageUrl;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
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
            onPressed: () => Navigator.pushNamed(context, '/'),
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
                      if (imagePath.startsWith('http'))
                        Image.network(
                          imagePath,
                          width: double.infinity,
                          height: height * 0.2,
                          fit: BoxFit.cover,
                        )
                      else
                        Image.file(
                          File(imagePath),
                          width: double.infinity,
                          height: height * 0.2,
                          fit: BoxFit.cover,
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
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                  child: FiledButton(
                    name: 'Add',
                    width: 1,
                    ontap: () {},
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
                        ontap: () {},
                      ))
                  : const SizedBox(),
            ],
          ),
        ),
      )),
    );
  }
}
