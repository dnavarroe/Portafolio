

import 'package:fl_components/models/models.dart';
import 'package:flutter/material.dart';

import '../screen/screen.dart';

class AppRoutes {

  static const initialRoute = 'homescreen';

  static final menuOptions = <MenuOption>[
    // TODO: borrar home
    //MenuOption(route: 'homescreen', name: 'HomeScreen', screen: const HomeScreen(), icon: Icons.home_outlined),
    MenuOption(route: 'listview1', name: 'List view 1', screen: const Listview1Screen(), icon: Icons.arrow_forward_ios_rounded),
    MenuOption(route: 'listview2', name: 'List view 2', screen: const Listview2Screen(), icon: Icons.arrow_forward_ios_rounded),
    MenuOption(route: 'alert', name: 'AlertScreen', screen: const AlertScreen(), icon: Icons.add_alert_sharp),
    MenuOption(route: 'card', name: 'CardScreen', screen: const CardScreen(), icon: Icons.credit_card_outlined),
    MenuOption(route: 'avatar', name: 'Circule Avatar', screen: const AvatarScreen(), icon: Icons.supervised_user_circle),
    MenuOption(route: 'animated', name: 'Animated Container', screen: const AnimatedScreen(), icon: Icons.animation_outlined),
    MenuOption(route: 'inputs', name: 'Inputs Screen', screen: const InputsScreen(), icon: Icons.inventory_sharp),
    MenuOption(route: 'Slider', name: 'Slider Screen', screen: const SliderScreen(), icon: Icons.slideshow_rounded),
    MenuOption(route: 'ListViewBuilder', name: 'Infinite Scroll', screen: const ListViewBuilderScreen(), icon: Icons.line_style_rounded),




  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {

    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'homescreen'       :(BuildContext context) =>  const HomeScreen()});

    for (final options in menuOptions){
      appRoutes.addAll({options.route       :(BuildContext context) =>  options.screen,});
    }

    return  appRoutes;
  }

  // static Map<String, Widget Function(BuildContext)> routes =  {
  //       'homescreen'       :(BuildContext context) => const HomeScreen(),
  //       'listview1'        :(BuildContext context) => const Listview1Screen(),
  //       'listview2'        :(BuildContext context) => const Listview2Screen(),
  //       'alert'            :(BuildContext context) => const AlertScreen(),
  //       'card'             :(BuildContext context) => const CardScreen()
  // };

  static Route<dynamic> onGenerateRoute( RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }

}