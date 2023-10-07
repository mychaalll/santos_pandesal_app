import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/components/dialogs.dart';
import 'package:santos_pandesal_app/providers/cart-provider.dart';

class CartTile extends StatelessWidget {
  final Cart cart;
  const CartTile({
    super.key, required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: (context){
                context.read<CartProvider>().removeCartItem(cart.product);
                showSuccessDialog(context, 'Item removed from cart.');
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  cart.product.thumbnail,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        cart.product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'x ${cart.quantity.toString()} pcs.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Total: ₱${(cart.product.price * cart.quantity).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                  ],
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}