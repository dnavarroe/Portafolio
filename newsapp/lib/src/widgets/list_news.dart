import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/mytheme.dart';

class ListNews extends StatelessWidget {

  final List<Article>news;

  const ListNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(noticia: news[index], index: index);
      },
    );
  }
}

class _New extends StatelessWidget {

  final Article noticia;
  final int index;

  const _New({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        _TargetTopBar(noticia: noticia, index: index,),

        _TargetTitulo(noticia: noticia),
        
        _TargetImage(noticia: noticia),

        _TargetBody(noticia: noticia),

        _TargetBotones(),

        const SizedBox(height: 10,),
        const Divider()
      ],
    );
  }
}

class _TargetBotones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          RawMaterialButton(
            onPressed: (){

            },
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.star_border),
          ),

          const SizedBox(width: 10,),

          RawMaterialButton(
            onPressed: (){

            },
            fillColor: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _TargetBody extends StatelessWidget {
  
  final Article noticia;

  const _TargetBody({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description != null) ? noticia.description :''),

    );
  }
}

class _TargetImage extends StatelessWidget {

  final Article noticia;

  const _TargetImage({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage !=null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/giphy.gif'), 
                  image: NetworkImage(noticia.urlToImage)
                )
              : const Image(image: AssetImage('assets/no-image.png'))  
        ),
      ),
    );
  }
}

class _TargetTitulo extends StatelessWidget {

  final Article noticia;

  const _TargetTitulo({super.key, required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TargetTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TargetTopBar({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}.', style: TextStyle(color: myTheme.accentColor),),
          Text('${noticia.source.name}.')
        ],
      ),
    );
  }
}