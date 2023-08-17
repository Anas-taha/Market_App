import 'package:flutter/material.dart';
import 'package:market_app/Widgets/Items_ListController.dart';

import 'package:market_app/itemsData/CoffeeData.dart';
import 'package:market_app/itemsData/IceCreamData.dart';
import 'package:market_app/itemsData/JuiceData.dart';
import 'package:market_app/itemsData/teaData.dart';
import 'package:market_app/provider/PaymentMethod.dart';

import 'package:market_app/provider/cartItem.dart';
import 'package:market_app/screens/Home.dart';
import 'package:market_app/screens/ItemsListView.dart';
import 'package:provider/provider.dart';
import 'screens/SplashScreen.dart';
import 'screens/Log_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Home_Page());
}

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TeaData>(
            create: (context) => TeaData()..getTeaData()),
        ChangeNotifierProvider<CoffeeData>(
            create: (context) => CoffeeData()..getCoffeeData()),
        ChangeNotifierProvider<JuiceData>(
            create: (context) => JuiceData()..getJuiceData()),
        ChangeNotifierProvider<IceCreamData>(
            create: (context) => IceCreamData()..getCreamData()),
        ChangeNotifierProvider<ItemsListController>(
            create: (context) => ItemsListController()),
        ChangeNotifierProvider<PaymentMethod>(
            create: (context) => PaymentMethod()),
        ChangeNotifierProvider<CartItems>(create: (context) => CartItems()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
