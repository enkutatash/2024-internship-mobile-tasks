import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';
import 'package:shop/pages/button_views.dart';
import 'package:shop/pages/textfield.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppColors.purple,
            )),
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Form(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
                width: double.infinity,
                height: height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.gray),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/image_icon.png",
                          width: 35,
                          height: 35,
                        )),
                    Text("Upload image"),
                  ],
                ),
              ),
              FieldDesc("name"),
              Textfield(),
              FieldDesc("Catagory"),
              Textfield(),
              FieldDesc("Price"),
              Textfield(
                suffixicon: true,
              ),
              FieldDesc("Description"),
              Textfield(
                fieldHeight: 0.25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Update(
                  name: "ADD",
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Delete(
                  name: "DELETE",
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
