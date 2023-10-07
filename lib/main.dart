import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/pages/check-out-page.dart';
import 'package:santos_pandesal_app/pages/main-page.dart';
import 'package:santos_pandesal_app/pages/landing-page.dart';
import 'package:santos_pandesal_app/pages/product-page.dart';
import 'package:santos_pandesal_app/providers/cart-provider.dart';
import 'package:santos_pandesal_app/providers/navigation-provider.dart';
import 'package:santos_pandesal_app/providers/product-provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavigationProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider()
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider()
        ),
      ],
      
      child: const MyApp(),
      
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Santos Pandesal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Rubik',
      ),
      home: const LandingPage(),
      routes: {
        '/intropage': (context) => const LandingPage(),
        '/mainpage': (context) => const MainPage(),
        '/productpage': (context) => ProductPage(),
        '/checkoutpage': (context) => const CheckOutPage()
      }
    );
  }
}

