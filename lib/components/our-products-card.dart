import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/models/product.dart';
import 'package:santos_pandesal_app/providers/product-provider.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

class OurProductsCard extends StatelessWidget {
  final Product product;
  const OurProductsCard({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.pushNamed(context,'/productpage');
          context.read<ProductProvider>().setCurrentProduct(product);
        },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 150,
        child: Stack(
          children: [
            // Product image
            Positioned.fill(
              child: Image.asset(
                product.thumbnail,
                fit: BoxFit.contain,
              ),
            ),
            // Dim background for text
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80, // Adjust this to control the height of the fading effect
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                       "₱${product.price.toStringAsFixed(2)}",
                       maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}