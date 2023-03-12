import 'package:flutter/material.dart';
import '../widget/widgets.dart';


class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Card Screen')
    ),),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children:  const [
          
           CumstonCard1(),
           SizedBox(height: 10,),
           CumstonCard2(imageUrl: 'https://pbs.twimg.com/media/FVfQ6gwVsAAwogC.jpg:large', name: 'Thorfinn',),
           SizedBox(height: 10,),
           CumstonCard2(imageUrl: 'https://static.wikia.nocookie.net/vsbattles/images/9/90/Thorfinn1021.jpg/revision/latest?cb=20190927050549', name: 'Thorfinn God',),
           SizedBox(height: 10,),
           CumstonCard2(imageUrl: 'https://i.pinimg.com/originals/ee/ac/38/eeac38d53b78f18fc651f555c48ac314.jpg', name: 'Eduard Elric',),
           SizedBox(height: 10,),
           CumstonCard2(imageUrl: 'https://images4.alphacoders.com/231/231208.png', name: 'Roy Mustang',),
           SizedBox(height: 10,),
           CumstonCard2(imageUrl: 'https://pbs.twimg.com/media/ExlmYE2W8AENaMl.jpg:large', name: 'Askelandd',),


        ],
      )
    );
  }
}

