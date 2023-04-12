import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/src/models/category_model.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_Base = 'newsapi.org';
final _ApiKey = '885001e534b74582a396bfed1948fe44';

class NewsService with ChangeNotifier{

  List<Article> headlines = [];
  String _selectedCategory = 'sports';

  List<Category> categories = [
    Category(FontAwesomeIcons.basketball, 'sports'),
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.hospital, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String,List<Article>> categoryArticles = {};

  


  NewsService(){
    getTopHeadlines();

    categories.forEach((item) { 
      categoryArticles[item.name] = [];
    });
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory( valor){
    _selectedCategory = valor;

    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada => categoryArticles[selectedCategory]!;


  getTopHeadlines([String country = 'co']) async{
    
    final url = Uri.https(_URL_Base, 'v2/top-headlines', {
      'apiKey': _ApiKey,
      'country': country
    });
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);
    
    headlines.addAll(newsResponse.articles);
    notifyListeners();

  }

  getArticlesByCategory(String category,[String country = 'co']) async{

    if(categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    
    final url = Uri.https(_URL_Base, 'v2/top-headlines', {
      'apiKey'    : _ApiKey,
      'country'   : country,
      'category'  : category
    });
    final resp = await http.get(url);

    final newsResponse = NewsResponse.fromJson(resp.body);
    categoryArticles[category]?.addAll(newsResponse.articles);
    
    notifyListeners();

  }


}