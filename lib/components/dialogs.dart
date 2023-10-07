import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/providers/cart-provider.dart';
import 'package:santos_pandesal_app/providers/navigation-provider.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

Future<void> showSuccessDialog(BuildContext context, String message) async {
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(20),
        contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        buttonPadding: EdgeInsets.all(10),
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          'Success',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.color3,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
                'OK',
                style: TextStyle(
                  color: AppColors.color3,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
        ],
      );
    }
  );
}
Future<void> showConfirmDialog(BuildContext context, String message,) async {
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(20),
        contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        buttonPadding: EdgeInsets.all(10),
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          'Confirm Order?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.color3,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              showSuccessOrderDialog(context, 'Your order has been processed.',  '/mainpage');
            },
            child: Text(
                'YES',
                style: TextStyle(
                  color: AppColors.color3,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
                'NO',
                style: TextStyle(
                  color: AppColors.color3,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
        ],
      );
    }
  );
}
Future<void> showSuccessOrderDialog(BuildContext context, String message, String route) async {
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(20),
        contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        buttonPadding: EdgeInsets.all(10),
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          'Success',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.color3,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              context.read<CartProvider>().clearCart();
              context.read<BottomNavigationProvider>().setCurrentIndex(0);
              Navigator.pushNamed(context, route);
            },
            child: Text(
                'OK',
                style: TextStyle(
                  color: AppColors.color3,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
        ],
      );
    }
  );
}

Future<void> showIncompleteDialog(BuildContext context, String message, String route) async {
  return await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.all(20),
        contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        buttonPadding: EdgeInsets.all(10),
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text(
          'Incomplete fields',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.color3,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
                'OK',
                style: TextStyle(
                  color: AppColors.color3,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
        ],
      );
    }
  );
}