import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/features/auth/presentation/widget/button.dart';
import 'package:ecommerce/features/auth/presentation/widget/checkbox.dart';
import 'package:ecommerce/features/auth/presentation/widget/label_reg.dart';
import 'package:ecommerce/features/auth/presentation/widget/logo.dart';
import 'package:ecommerce/features/auth/presentation/widget/password_field.dart';
import 'package:ecommerce/features/auth/presentation/widget/text_field_reg.dart';
import 'package:ecommerce/features/products/presentation/widget/button_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              Center(
                child: Logo(
                  boxHeight: 0.07,
                  boxWidth: 0.4,
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Text(
                "Sign into your account",
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.03,
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
              PasswordField(
                hintText: "************",
              ),
              SizedBox(
                height: height * 0.04,
              ),
              ButtonReg(
                name: "SIGN IN",
                width: width * 0.8,
                height: 0.06,
              ),
              SizedBox(
                height: height * 0.3,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.poppins(
                        color: AppColors.textGrey, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SIGN UP',
                        style: GoogleFonts.poppins(
                            color: AppColors.purple, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/register');
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
