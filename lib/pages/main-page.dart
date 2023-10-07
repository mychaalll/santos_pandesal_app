import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/pages/about-page.dart';
import 'package:santos_pandesal_app/pages/cart-page.dart';
import 'package:santos_pandesal_app/pages/home-page.dart';
import 'package:santos_pandesal_app/pages/shop-page.dart';
import 'package:santos_pandesal_app/providers/navigation-provider.dart';
import 'package:santos_pandesal_app/utils/colors.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    ShopPage(),
    CartPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        color: AppColors.color3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            selectedIndex: context.read<BottomNavigationProvider>().currentIndex,
            onTabChange: (index){
              setState(() {
                context.read<BottomNavigationProvider>().setCurrentIndex(index);
                context.read<BottomNavigationProvider>().setActiveContainer('');
              });
            },
            backgroundColor: AppColors.color3,
            color: Colors.white,
            activeColor: AppColors.color3,
            tabBackgroundColor: Colors.white,
            gap: 8,
            padding: EdgeInsets.all(10),
            tabs: const[
              GButton(
                icon: Icons.home_filled,
                text: 'HOME',
              ),
              GButton(
                icon: FontAwesomeIcons.shoppingBag,
                iconSize: 20,
                text: 'PRODUCTS',
              ),
              GButton(
                icon: FontAwesomeIcons.cartShopping,
                iconSize: 20,
                text: 'CART',
              ),
              GButton(
                icon: Icons.person_2,
                text: 'PROFILE',
              )
            ],
          ),
        ),
      ),
      body: _pages[context.watch<BottomNavigationProvider>().currentIndex],
    );
  }
}




