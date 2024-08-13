import 'dart:io';

import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/presentation/add_product/bloc/add_product_bloc.dart';
import 'package:ecommerce/features/products/presentation/add_product/bloc/add_product_state.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_event.dart';
import 'package:ecommerce/features/products/presentation/widget/button_fields.dart';
import 'package:ecommerce/features/products/presentation/widget/input_field.dart';
import 'package:ecommerce/features/products/presentation/widget/red_button.dart';
import 'package:ecommerce/features/products/presentation/widget/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatelessWidget {
  final ProductEntity? item;
  const AddProductPage({this.item, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final ImagePicker _picker = ImagePicker();

    Future<void> _pickImage(ImageSource source) async {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        context
            .read<AddProductBloc>()
            .add(OnImageChanged(imageUrl: pickedFile.path));
      } else {
        debugPrint('No image selected.');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppColors.purple,
            )),
        title: CustomText(
          text: item != null ? 'Edit Product' : 'Add Product',
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
                      BlocBuilder<AddProductBloc, AddProductState>(
                          builder: (context, state) {
                        if (state.imageUrl.isNotEmpty &&
                            state.imageUrl !=
                                "https://st4.depositphotos.com/14953852/24787/v/380/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg") {
                          return Image.file(
                              width: double.infinity,
                              height: height * 0.2,
                              fit: BoxFit.cover,
                              File(state.imageUrl));
                        }

                        return const Center(
                          child: Text("Upload Image"),
                        );
                      }),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: IconButton(
                            onPressed: () => _pickImage(ImageSource.gallery),
                            icon: const Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.white,
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
                onChange: (name) => context
                    .read<AddProductBloc>()
                    .add(OnNamedChanged(name: name)),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              const CustomText(text: 'Price'),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                  onChange: (price) => context
                      .read<AddProductBloc>()
                      .add(OnPriceChanged(price: double.parse(price))),
                  suffixicon: true,
                  suffix: Icons.attach_money_sharp,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true)),
              SizedBox(
                height: height * 0.012,
              ),
              const CustomText(text: 'Description'),
              SizedBox(
                height: height * 0.012,
              ),
              InputField(
                onChange: (description) => context
                    .read<AddProductBloc>()
                    .add(OnDescriptionChanged(description: description)),
                fieldHeight: 0.25,
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
                    ontap: () {
                      context.read<AddProductBloc>().add(OnSubmit());
                      Navigator.pushNamed(context, '/');
                    },
                  )),
              SizedBox(
                height: height * 0.012,
              ),
              item != null
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
