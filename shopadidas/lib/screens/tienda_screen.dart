import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopadidas/models/cart.dart';
import 'package:shopadidas/models/shoe.dart';
import 'package:shopadidas/widgets/widgets.dart';

class TiendaScreen extends StatefulWidget {
   
  const TiendaScreen({Key? key}) : super(key: key);

  @override
  State<TiendaScreen> createState() => _TiendaScreenState();
}

class _TiendaScreenState extends State<TiendaScreen> {

  // add shoe to cart
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        title: Text('Sucessfully added'),
        content: Text('Check your cart'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              ),
               Icon(
                Icons.search,
                color: Colors.grey,
              )

            ],
          ),
        ),
        // message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            'Fly like a butterfly sting like a bee',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const  [
              Text(
                'Hot Picks 🔥',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'See all',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ],
          ),
        ),

        const SizedBox(height: 10,),
        
        // list of shoes for sale
        
        Expanded(child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            // get a shoe from shop list
            Shoe shoe = value.getShoeList()[index];

            //return the shoe
            return ShoeTile(
              shoe: shoe,
              onTap: () => addShoeToCart(shoe),
            );
          },
        ),
        ),

        const Padding(
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
        //hot picks
      ],
    ));
  }
}