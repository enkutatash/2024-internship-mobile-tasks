import 'package:ecommerce/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/page_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dialogBackgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      routerConfig: goRoute,
    );
  }
}
