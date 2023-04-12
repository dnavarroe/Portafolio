import 'package:flutter/material.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/services/news_services.dart';
import 'package:newsapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {

  static String routename = 'Tab2';
   
  const Tab2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListCategories(),

            Expanded(
              child: ListNews(news: newsServices.getArticulosCategoriaSeleccionada)
            )
          ],
        )
      ),
    );
  }
}

class _ListCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {

            final cName = categories[index].name;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryBotton(categoria: categories[index]),
                const SizedBox(height: 5,),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryBotton extends StatelessWidget {
  
  final Category categoria;

  const _CategoryBotton({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: (){

        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(categoria.icon, 
        color: (newsService.selectedCategory == categoria.name) ? Colors.pinkAccent :Colors.black54,
        ),
      ),
    );
  }
}