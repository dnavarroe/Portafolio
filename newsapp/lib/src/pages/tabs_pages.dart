import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/pages.dart';
import 'package:provider/provider.dart';

class TabsPages extends StatelessWidget {

  static String routename = 'Tabs';
   
  const TabsPages({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
        ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navegationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navegationModel.pageActual,
      onTap: (i) => navegationModel.pageActual = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados')
      ],
    );
  }
}

class _Pages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegationModel = Provider.of<_NavigationModel>(context);
    
    return PageView(
      controller: navegationModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Page(),

        Tab2Page()
      ],
    );
  }
}

class _NavigationModel extends ChangeNotifier{

  int _pageActual = 0;
  PageController _pageController = PageController();

  int get pageActual => _pageActual;

  set pageActual(int valor){
    _pageActual = valor;

    _pageController.animateToPage(valor, duration: const Duration(milliseconds: 250),curve: Curves.bounceInOut);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}