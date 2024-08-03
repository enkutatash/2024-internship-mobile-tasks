import 'package:ecommerce/data/colors.dart';
import 'package:ecommerce/data/page_route.dart';
import 'package:ecommerce/data/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          dialogBackgroundColor: AppColors.white,
          scaffoldBackgroundColor: AppColors.white,
          useMaterial3: true,
          fontFamily: 'Montserrat',
        ),
        routerConfig: goRoute,
      ),
    );
  }
}
