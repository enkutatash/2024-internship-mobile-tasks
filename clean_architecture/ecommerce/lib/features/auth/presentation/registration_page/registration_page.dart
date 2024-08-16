import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/auth/presentation/widget/button.dart';
import 'package:ecommerce/features/auth/presentation/widget/checkbox.dart';
import 'package:ecommerce/features/auth/presentation/widget/label_reg.dart';
import 'package:ecommerce/features/auth/presentation/widget/logo.dart';
import 'package:ecommerce/features/auth/presentation/widget/text_field_reg.dart';
import 'package:ecommerce/features/products/presentation/widget/button_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.back,
                      color: AppColors.purple,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  Logo(),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "Create your account",
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              LabelReg(text: "Name"),
              SizedBox(
                height: height * 0.01,
              ),
              TextFieldReg(
                hintText: "ex:jon smith",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              LabelReg(text: "Email"),
              SizedBox(
                height: height * 0.01,
              ),
              TextFieldReg(
                hintText: "ex: jon.smith@email.com",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              LabelReg(text: "Password"),
              SizedBox(
                height: height * 0.01,
              ),
              TextFieldReg(
                hintText: "************",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              LabelReg(text: "Confirm Password"),
              SizedBox(
                height: height * 0.01,
              ),
              TextFieldReg(
                hintText: "************",
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomCheckBox(
                value: false,
                onChanged: (val) {},
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ButtonReg(
                name: "SIGN UP",
                width: width * 0.8,
                height: 0.06,
              ),
              SizedBox(
                height: height * 0.15,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Have an account? ',
                    style: GoogleFonts.poppins(
                        color: AppColors.textGrey, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SIGN IN',
                        style: GoogleFonts.poppins(
                            color: AppColors.purple, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
