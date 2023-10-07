import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/components/our-products-card.dart';
import 'package:santos_pandesal_app/components/promotion-card.dart';
import 'package:santos_pandesal_app/models/product.dart';
import 'package:santos_pandesal_app/providers/navigation-provider.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text(
              'HOME',
              style: TextStyle(
                color: AppColors.color3,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            // SizedBox(height: 20),
            // Container(
            //   height: 50,
            //   child: TextField(
            //     maxLines: 1,
            //     textAlignVertical: TextAlignVertical.center,
            //     decoration: InputDecoration(
            //       hintText: 'Search a product...',
            //       suffixIcon: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(12),
            //           color: AppColors.color3,
            //         ),
            //         child: Icon(
            //           Icons.search, 
            //           color: Colors.white,
            //         ),
            //       ),
            //       filled: true,
            //       fillColor: Colors.grey[400],
            //       border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide.none
            //     ),
            //     )
            //   ),
            // ),
            SizedBox(height: 20),
            PromotionCard(),
            SizedBox(height: 20),

            Container(
              height: 50,
              child: Row(
                children: [
                  MenuButtons(
                    title: 'BREADS',
                    onTap: (){
                      Provider.of<BottomNavigationProvider>(context, listen: false).setCurrentIndex(1);
                      Provider.of<BottomNavigationProvider>(context, listen: false).setActiveContainer('breads');
                    },
                  ),
                  SizedBox(width: 10),
                  MenuButtons(
                    title: 'SPREADS', 
                    onTap: () {
                      Provider.of<BottomNavigationProvider>(context, listen: false).setCurrentIndex(1);
                      Provider.of<BottomNavigationProvider>(context, listen: false).setActiveContainer('spreads');
                    },
                  ),
                  SizedBox(width: 10),
                  MenuButtons(
                    title: 'DRINKS',
                    onTap: () {
                      Provider.of<BottomNavigationProvider>(context, listen: false).setCurrentIndex(1);
                      Provider.of<BottomNavigationProvider>(context, listen: false).setActiveContainer('drinks');
                    },
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Our Top Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 20),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  OurProductsCard(product: breadList[0],),
                  SizedBox(width: 20),
                  OurProductsCard(product: breadList[1],),
                  SizedBox(width: 20),
                  OurProductsCard(product: breadList[2],),
                  SizedBox(width: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<BottomNavigationProvider>(context, listen: false).setCurrentIndex(1);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.color3
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                            Text(
                              'View more products',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Favorites',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'None',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButtons extends StatelessWidget {
  final Function() onTap;
  final String title;
  const MenuButtons({
    super.key, required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.color3,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.0,
              color: AppColors.color3,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.color4,
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  }
}
