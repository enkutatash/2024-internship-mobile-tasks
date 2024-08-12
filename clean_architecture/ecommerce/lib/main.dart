
import 'package:dio/dio.dart';
import 'package:ecommerce/core/network/network.dart';
import 'package:ecommerce/features/products/data/data_source/local_data_source.dart';
import 'package:ecommerce/features/products/data/data_source/remote_data_source.dart';
import 'package:ecommerce/features/products/data/repository/product_repository_imp.dart';
import 'package:ecommerce/features/products/domain/usecase/get_all_product_usecase.dart';
import 'package:ecommerce/features/products/presentation/home_bloc/bloc/home_page_bloc.dart';
import 'package:ecommerce/features/products/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RemoteDataSource remoteDataSource = RemoteDataSource(dio: Dio());
  final sharedPreferences = await SharedPreferences.getInstance();
  LocalDataSource localDataSource =
      LocalDataSource(sharedPreferences: sharedPreferences);
  Bloc.observer = ProductObserver();

  ProductRepositoryImp productRepositoryImp = ProductRepositoryImp(
      api: remoteDataSource,
      networkInfo:
          NetworkInfoImple(connectionChecker: InternetConnectionChecker()),
      localSource: localDataSource);

  GetAllProductUsecase getAllroductUsecase =
      GetAllProductUsecase(productRepository: productRepositoryImp);

  runApp(MainScreen(
    getAllProductUsecase: getAllroductUsecase,
  ));
}

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  GetAllProductUsecase getAllProductUsecase;
  MainScreen({required this.getAllProductUsecase, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) =>
                  HomePageBloc(getAllProductUsecase: getAllProductUsecase),
              child: const HomePage(),
            ),
      },
    );
  }
}


