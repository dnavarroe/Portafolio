import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Avatars')),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child:  CircleAvatar(
              backgroundColor: Colors.purple[300],
              child: const Text('Dn'),
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage('http://pm1.narvii.com/7695/b4124da5d57417a7bed74442e1b8c9ee6a5014d7r1-414-414v2_uhq.jpg'),
         ),
      ),
    );
  }
}