import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/network.dart';
import 'package:ecommerce/features/auth/domain/usecase/register_usecase.dart';
import 'package:ecommerce/features/auth/presentation/registration_page/login_page.dart';
import 'package:ecommerce/features/auth/presentation/registration_page/registration_page.dart';
import 'package:ecommerce/features/products/data/data_source/local_data_source.dart';
import 'package:ecommerce/features/products/data/data_source/remote_data_source.dart';
import 'package:ecommerce/features/products/data/repository/product_repository_imp.dart';
import 'package:ecommerce/features/products/domain/entities/product_entity.dart';
import 'package:ecommerce/features/products/domain/usecase/add_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/delete_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:ecommerce/features/products/domain/usecase/update_product_usecase.dart';
import 'package:ecommerce/features/products/presentation/add_product/bloc/add_product_bloc.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:ecommerce/features/products/presentation/page/add_product_page.dart';
import 'package:ecommerce/features/products/presentation/page/home_page.dart';
import 'package:ecommerce/features/products/presentation/page/search_page.dart';
import 'package:ecommerce/features/products/presentation/search_page/bloc/search_bloc.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/register/bloc/register_bloc.dart';

// kelbi

class ProductObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ProductObserver();

  await setUp();

  runApp(MainScreen());
}

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(
            updateProductUsecase: locator<UpdateProductUsecase>(),
            deleteProductUsecase: locator<DeleteProductUsecase>(),
            getAllProductUsecase: locator<GetAllProductUsecase>(),
            addProductUsecase: locator<AddProductUsecase>(),
          )..add(FetchAllProducts()),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
            create: (context) =>
                RegisterBloc(registerUsecase: locator<RegisterUsecase>()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/register',
        routes: {
          '/': (context) => const HomePage(),
          '/add_product': (context) => const AddProductPage(),
          '/search': (context) => const SearchPage(),
          '/register': (context) => const RegistrationPage(),
          '/login': (context) => const LoginPage()
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/update') {
            final item = settings.arguments as ProductEntity?;
            return MaterialPageRoute(
              builder: (context) {
                return AddProductPage(item: item);
              },
            );
          }
          return null;
        },
      ),
    );
  }
}
