import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopadidas/models/cart.dart';
import 'package:shopadidas/models/shoe.dart';

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
   
  const CartScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal:25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //heading
          const Text(
            'My Cart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),

          const SizedBox(height: 20,),

          Expanded(child: ListView.builder(
            itemCount: value.getUserCart().length,
            itemBuilder: (BuildContext context, int index) {
              //get indiviual shoe
              Shoe individualShoe = value.getUserCart()[index];
              // return the cart item
              return CartItem(shoe: individualShoe,);
            },
          ),)
        ]
        ),
    ),
    );
  }
}