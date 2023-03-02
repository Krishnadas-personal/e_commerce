import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'provider/Product_Provider.dart';
import 'provider/product_detail_provider.dart';
import 'screens/productList.dart';
import 'screens/product_details.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductDetailProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const HomePage(),
        routes: {
          ProductDetial.routeName: (cxt) => ProductDetial(),
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
