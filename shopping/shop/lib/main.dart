import 'package:flutter/material.dart';
import 'package:shop/const/app_colors.dart';
import 'package:shop/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white, fontFamily: "Poppins"),
    );
  }
}
