import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_services.dart';
import 'package:newsapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {

  static String routename = 'Tab1';
   
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;

    
    return Scaffold(
      body: (headlines.length == 0)
            ? const Center(child: CircularProgressIndicator())
            : ListNews(news: headlines)
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}