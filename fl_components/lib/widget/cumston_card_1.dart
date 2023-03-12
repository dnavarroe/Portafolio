

import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class CumstonCard1 extends StatelessWidget {

  const CumstonCard1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children:  [
          const ListTile(
            leading: Icon(Icons.photo_album, color: AppTheme.primary),
            title: Text('Hola, me llamo Daniel'),
            subtitle: Text('Y me encantan las tetas'),
          ),
        
        
          Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                  ),

                TextButton(
                  onPressed: () {}, 
                  child: const Text('Ok')
                  )

              ],

            ),
          )
        
        
        ],
      ),
    );
  }
}