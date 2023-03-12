
import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CumstonCard2 extends StatelessWidget {

  final String imageUrl;
  final String? name;

  const CumstonCard2({
    super.key, 
    required this.imageUrl, 
    this.name});

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 10,
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children:   [

      
           FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
        ),
        if (name != null)
          Container(
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child:  Text(name!),
          )

        ],
      ),
    );
  }
}

 