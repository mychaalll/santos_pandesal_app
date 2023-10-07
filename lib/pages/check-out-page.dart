import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/components/dialogs.dart';
import 'package:santos_pandesal_app/providers/cart-provider.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String _selectedOption = 'Pick-up';
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  double _totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child){
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Your Order',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.color3,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 0.5
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        TitleText(title: 'Name of Customer',),
                        SizedBox(height: 5),
                        ReusableTextBox(hintText: 'Name',controller: _nameController,),
                        SizedBox(height: 10),
                        TitleText(title: 'Mode of Order'),
                        SizedBox(height: 5),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton<String>(
                            underline: Container(),
                            iconEnabledColor: AppColors.color3,
                            icon: Icon(Icons.sort),
                            isExpanded: true,
                            value: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                                
                              });
                            },
                            items: <String>[
                              'Pick-up',
                              'Delivery',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10),
                        //if delivery is the option
                        _selectedOption == 'Delivery'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                TitleText(title: 'Address'),
                                SizedBox(
                                  height: 5,
                                ),
                                ReusableTextBox(
                                  hintText: 'Address',
                                  controller: _addressController,
                                ),
                              ],
                            )
                          : Column(
                            children: [
                              Text(
                                'For Pick-up Deliveries, get your order at',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12, 
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Gagalangin Tondo Manila near Puregold Tayuman ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16, 
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                        SizedBox(height: 10),
                        
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 0.5
                        )
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Order Summary',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                            ),
                            ),
                          SizedBox(height: 10),
                          SizedBox(height: 10,),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: cart.cartItems.length,
                              itemBuilder: (context, index) {
                                Cart item = cart.cartItems[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            item.product.name
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'x ${item.quantity}'
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            '₱${(item.product.price * item.quantity).toStringAsFixed(2)}',
                                            textAlign: TextAlign.end,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                );
                              }
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Time of Order:', style: TextStyle(fontWeight: FontWeight.w500)),
                              Text(DateFormat('hh:mm aa').format(DateTime.now())),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date of Order:', style: TextStyle(fontWeight: FontWeight.w500)),
                              Text(DateFormat('MMM dd yyyy').format(DateTime.now())),
                            ]
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal:', style: TextStyle(fontWeight: FontWeight.w500)),
                              Text('₱ ${cart.calculateTotalPrice().toStringAsFixed(2)}'),
                            ]
                          ),
                          _selectedOption == 'Delivery' ?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery Fee:', style: TextStyle( fontWeight: FontWeight.w500)),
                              Text('₱ 10.00'),
                            ]
                          )
                          : Container(),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                              Text('₱ ${(_selectedOption == 'Delivery' ? 10 + cart.calculateTotalPrice() : 0 + cart.calculateTotalPrice()).toStringAsFixed(2)}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            ]
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      if(_selectedOption == 'Delivery'){
                        _totalPrice = cart.calculateTotalPrice() + 10;
                      }
                      else{
                        _totalPrice = cart.calculateTotalPrice();
                      }
                      print(_totalPrice);
                      showConfirmDialog(context, 'Kindly be informed that once you proceed with this order at checkout, it will be considered final and cannot be subjected to cancellation or modifications. Are you prepared to confirm your purchase? ');
                    },
                    child: Container(
                      height: 50,
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
                            'Finalize Order',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class ReusableTextBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const ReusableTextBox({
    super.key, required this.controller, required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextField(
        controller: controller,
        maxLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: hintText,
          
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none
          ),
        ),
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600
      ),
    );
  }
}