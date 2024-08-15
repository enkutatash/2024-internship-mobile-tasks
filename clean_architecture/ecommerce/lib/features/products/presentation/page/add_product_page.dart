import 'dart:io';

import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/presentation/add_product/bloc/add_product_bloc.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:ecommerce/features/products/presentation/widget/button_fields.dart';
import 'package:ecommerce/features/products/presentation/widget/input_field.dart';
import 'package:ecommerce/features/products/presentation/widget/red_button.dart';
import 'package:ecommerce/features/products/presentation/widget/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _formKey = GlobalKey<FormState>();

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
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: Container(
                        width: double.infinity,
                        height: height * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.lightGrey),
                        child: Stack(
                          children: [
                            if (imagePath != null && imagePath.isNotEmpty)
                              imagePath.startsWith('http')
                                  ? Image.network(
                                      imagePath,
                                      width: double.infinity,
                                      height: height * 0.2,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(imagePath!),
                                      width: double.infinity,
                                      height: height * 0.2,
                                      fit: BoxFit.cover,
                                    )
                            else
                              const Center(
                                child: Text("No image Uploaded"),
                              ),
                            Positioned(
                              right: 10,
                              bottom: 10,
                              child: IconButton(
                                  onPressed: () =>
                                      _pickImage(ImageSource.gallery),
                                  icon: Image.asset(
                                    'assets/images/image_icon.png',
                                    width: 35,
                                    height: 35,
                                  )),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: height * 0.012,
                  ),
                  const CustomText(text: 'name'),
                  SizedBox(
                    height: height * 0.012,
                  ),
                  InputField(
                    hintText: "Product Name",
                    validator: (value) =>
                        value!.isEmpty ? 'Name is required' : null,
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
                    hintText: "Product Price",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Price is required';
                      }

                      double? price = double.tryParse(value);
                      if (price == null) {
                        return 'Please enter a valid number';
                      }

                      if (price < 0) {
                        return 'Price cannot be negative';
                      }

                      return null;
                    },
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
                    hintText: "Product Description",
                    validator: (value) =>
                        value!.isEmpty ? 'Description is required' : null,
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
                        // ignore: unnecessary_null_comparison
                        name: widget.item != null ? 'Update' : 'Add',
                        width: 1,
                        ontap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            if (widget.item != null) {
                              context.read<HomePageBloc>().add(
                                  UpdateProductPress(
                                      id: widget.item!.id,
                                      description: description.text,
                                      name: name.text,
                                      price: double.parse(price.text),
                                      imageUrl: imagePath));
                            } else {
                              context.read<HomePageBloc>().add(AddProductPress(
                                  description: description.text,
                                  name: name.text,
                                  price: double.parse(price.text),
                                  imageUrl: imagePath));
                            }
                            Navigator.pushNamed(context, '/');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'The data you Entered is not valid!')),
                            );
                          }
                        },
                      )),
                  SizedBox(
                    height: height * 0.012,
                  ),
                  widget.item != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 10),
                          child: RedOutlinedButton(
                            name: 'DELETE',
                            width: 1,
                            ontap: () {
                              context
                                  .read<HomePageBloc>()
                                  .add(DeleteProduct(id: widget.item!.id));
                              Navigator.pushNamed(context, '/');
                            },
                          ))
                      : const SizedBox(),
                ],
              ),
            ),
          )),
    );
  }
}
