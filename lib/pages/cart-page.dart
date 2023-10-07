import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/components/cart-tile.dart';
import 'package:santos_pandesal_app/providers/cart-provider.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String _selectedSortOption = 'Default';
  List _sortedCartList = [];

  void _onSortOptionChanged(String? newValue) {
    setState(() {
      _selectedSortOption = newValue!;
      // Perform sorting logic based on the selected option
    });
    
  }

  void _performSorting() {
    switch (_selectedSortOption) {
      case 'Name (A-Z)':
        _sortedCartList
            .sort((a, b) => a.product.name.compareTo(b.product.name));
        break;
      case 'Name (Z-A)':
        _sortedCartList
            .sort((a, b) => b.product.name.compareTo(a.product.name));
        break;
      case 'Price (Low to High)':
        _sortedCartList.sort((a, b) => (a.product.price * a.quantity)
            .compareTo(b.product.price * b.quantity));
        break;
      case 'Price (High to Low)':
        _sortedCartList.sort((a, b) => (b.product.price * b.quantity)
            .compareTo(a.product.price * a.quantity));
        break;
      default:
        // Handle Default or unknown sorting option
        break;
    }
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child){
        _sortedCartList = context.read<CartProvider>().cartItems;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Text(
                  'CART',
                  style: TextStyle(
                    color: AppColors.color3,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    iconEnabledColor: AppColors.color3,
                    icon: Icon(Icons.sort),
                    isExpanded: true,
                    value: _selectedSortOption,
                    onChanged: (value) {
                      _onSortOptionChanged(value);
                      _performSorting();
                    },
                    items: <String>[
                      'Default',
                      'Name (A-Z)',
                      'Name (Z-A)',
                      'Price (Low to High)',
                      'Price (High to Low)',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                child: _sortedCartList.length != 0
                    ? SingleChildScrollView(
                        child: Container(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: _sortedCartList.length,
                              itemBuilder: ((context, index) {
                                Cart cartDetails = _sortedCartList[index];
                                return CartTile(cart: cartDetails);
                              })),
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bagShopping,
                              size: 100,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'No Items in Cart',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                  ),
                ),
                SizedBox(height: 10),
                _sortedCartList.length != 0
                  ? GestureDetector(
                      onTap: () {
                        print(context.read<CartProvider>().calculateTotalPrice().toStringAsFixed(2));
                        Navigator.pushNamed(context, '/checkoutpage');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.color3,
                            borderRadius: BorderRadius.circular(12)),
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
                              'Check out',
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
                  : Container(),
                SizedBox(height: 10),

              ],
            ),
          ),
        );
      }
    );
  }
}

