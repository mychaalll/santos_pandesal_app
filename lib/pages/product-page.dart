import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/components/dialogs.dart';
import 'package:santos_pandesal_app/models/product.dart';
import 'package:santos_pandesal_app/providers/cart-provider.dart';
import 'package:santos_pandesal_app/providers/product-provider.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

class ProductPage extends StatefulWidget {


  ProductPage({super.key,});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double _totalPrice = 0;
  int _quantity = 0;

  void addQuantity(double price){
    setState(() {
      _totalPrice = _totalPrice + price;
      _quantity++;
    });
  }

  void subtractQuantity(double price){
    if (_quantity > 0) {
      setState(() {
        _totalPrice = _totalPrice - price;
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, product, child) { 
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Image.asset(
                        product.currentProduct.thumbnail,
                        fit: BoxFit.contain,
                      )
                    ),
                  )
                ),
                SizedBox(height: 20),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      color: AppColors.color4,
                    ),
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          product.currentProduct.name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '₱ ${product.currentProduct.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              product.currentProduct.details,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  color: AppColors.color3,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '₱ ${_totalPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                subtractQuantity(product.currentProduct.price);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.color5
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              child: Text(
                                _quantity.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                addQuantity(product.currentProduct.price);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.color5
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap:(){
                          if(_quantity != 0){
                            context.read<CartProvider>().addItemToCart(product.currentProduct, _quantity);
                            showSuccessDialog(context, 'Item successfully added.');
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Invalid quantity. Try again.',
                                )
                              )
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.color5,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.cartPlus,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}