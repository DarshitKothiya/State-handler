import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food/provider/FoodProvider.dart';
import 'package:food/view/screen/Cart.dart';
import 'package:food/view/screen/Detail.dart';
import 'package:food/view/screen/Favorite.dart';
import 'package:food/view/screen/Homepage.dart';
import 'package:provider/provider.dart';
import 'provider/FoodProvider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context)=> FoodProvider(),
      builder: (context, _){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const HomePage(),
            'detail': (context) => const DetailPage(),
            'cart': (context) => const CartPage(),
            'favorite': (context) => const FavoritePage(),
          },

        );
      },

    )
  );
}