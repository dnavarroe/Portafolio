import 'package:flutter/material.dart';
import 'package:shopadidas/screens/screens.dart';
import 'package:shopadidas/widgets/widgets.dart';

class ShopScreen extends StatefulWidget {
   
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  //this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Screens to display
  final List<Widget> _screens = [
    // Tienda screen
    const TiendaScreen(),

    //Cart screen
    const CartScreen()


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) {
          navigateBottomBar(index);},
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              }, 
              icon: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ))
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            //logo
            Column(
              children: [
                DrawerHeader(child: Image.asset(
              'assets/logo.png',
              color: Colors.white,
              )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                color: Colors.grey[800],
              ),
            ),

            //other screen
            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
              ],
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),


          ]
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}