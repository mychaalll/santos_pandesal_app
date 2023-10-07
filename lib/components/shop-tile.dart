import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/models/product.dart';
import 'package:santos_pandesal_app/providers/product-provider.dart';

class ShopTile extends StatelessWidget {
  final Product product;
  const ShopTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context,'/productpage');
          context.read<ProductProvider>().setCurrentProduct(product);
        },
        child: Container(
          padding: EdgeInsets.all(8),
          height: 100, 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  product.thumbnail,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        '₱${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
      
            ],
          ),
        ),
      ),
    );
  }
}