import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/provider/product_api_provider.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/view/prodcut_api_details_page/prodcut_api_details_page.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/view/product_api_screens/product_api_home_page.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_recepies_api/provider/recepies_api_provider.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_recepies_api/view/recepies_api_home_page/recepies_api_home_page.dart';
import 'package:adv_flutter_ch_9/task%20-9.1%20Pixabay%20Api/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task - 9.2 -Dummy Api/Dummy_recepies_api/view/recepies_api_home_page/recipesDetailsPage/recipesDetailsPage.dart';
import 'task -9.1 Pixabay Api/view/pixabay_home_page/pixabay_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PixaApiProvider(),
        ),
        ChangeNotifierProvider(create: (context) => RecepiesApiProvider()),
        ChangeNotifierProvider(create: (context) => ProductApiProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>pixaPage()
          // '/': (context) => recipesHomePage(),
          // '/deatils':(context)=>recipesDetailsPage(),
          // '/': (context) => productApiHomePage(),
          // '/la': (context) => productDeatilsPage()
        },
      ),
    );
  }
}
