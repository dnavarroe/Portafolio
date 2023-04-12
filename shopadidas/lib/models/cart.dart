import 'package:flutter/cupertino.dart';
import 'package:shopadidas/models/shoe.dart';

class Cart extends ChangeNotifier{

  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Gorum low', 
      price: '250.00', 
      imagePath: 'assets/Gorum-low.png', 
      description: 'Nice and on fire'
    ),
    Shoe(
      name: 'Rod laver', 
      price: '210.00', 
      imagePath: 'assets/rod-laver.png', 
      description: 'The One Piece...The One piece is real'
    ),
    Shoe(
      name: 'UltraGoost', 
      price: '270.00', 
      imagePath: 'assets/ultragoost.png', 
      description: 'Seguimos con los versos perversos demuestro a todos que ejerso'
    ),
    Shoe(
      name: 'Yeezy', 
      price: '410.00', 
      imagePath: 'assets/Yeezy.jpeg', 
      description: 'I love your titties cause the prove I can focus on 2 things at once'
    ),
    Shoe(
      name: 'Adidas Bad bunny', 
      price: '180', 
      imagePath: 'assets/badbunny.jpg', 
      description: 'bad bunny shoe'
    )
  ];


  // list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }
  //get cart
  List<Shoe> getUserCart(){
    return userCart;
  }

  //add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}