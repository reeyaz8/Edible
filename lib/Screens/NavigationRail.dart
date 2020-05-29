import 'package:Edible/Screens/NavBarScreens/accountPage.dart';
import 'package:Edible/Screens/NavBarScreens/beveragePage.dart';
import 'package:Edible/Screens/NavBarScreens/cartPage.dart';
import 'package:Edible/Screens/NavBarScreens/fruitPage.dart';
import 'package:Edible/Screens/NavBarScreens/vegetablePage.dart';
import 'package:flutter/material.dart';
import 'NavBarScreens/bakeryPage.dart';

class Navigation extends StatefulWidget {
    const Navigation({Key key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 2;
  List<Widget> screens = [BakeryPage(), BeveragePage(), FruitPage(), VegetablePage(), CartPage(), AccountPage()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        body: Row(
        children: <Widget>[
          NavigationRail(
          minWidth: 30.0,
          selectedIndex: _selectedIndex,
          selectedLabelTextStyle: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              ),
          unselectedLabelTextStyle: TextStyle(color: Colors.blue,
          fontSize: 16.0,
          fontWeight: FontWeight.w400
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.deepOrange,
            size: 32.0
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.blue,
            size:25.0
          ),
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          groupAlignment: 0.0,
          labelType: NavigationRailLabelType.all,
          destinations: [
            NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "Bakery",
                    ),
                  ),
                )),
            NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "Beverages",
                    ),
                  ),
                )),
            NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "Fruits",
                    ),
                  ),
                )),
            NavigationRailDestination(
                icon: SizedBox.shrink(),
                label: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "Vegetables",
                    ),
                  ),
                )),
                NavigationRailDestination(
              label: SizedBox.shrink(),
              icon: SizedBox(
                width: 20.0,
                child:Icon(Icons.shopping_cart))
            ),
            NavigationRailDestination(
              label: SizedBox.shrink(),
              icon: SizedBox(
                width: 20.0,
                child:Icon(Icons.person))
            )
          ],
          ),
          Container(width: 10.0, color: Colors.white,),
          Expanded(
            // key: PageStorageKey('navigation'),
            child: screens[_selectedIndex])
        ],
          ),
      ),
    );
  }
}