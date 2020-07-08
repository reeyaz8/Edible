import 'package:Edible/Provider/API_Call/BeveragesAPI/search.dart';
import 'package:Edible/Provider/Data/beverage.dart';
import 'package:Edible/Screens/SearchPage/beverageSearchPage.dart';
import 'package:Edible/Screens/beveragesSubScreens/harddrink.dart';
import 'package:Edible/Screens/beveragesSubScreens/softdrink.dart';
import 'package:Edible/Screens/beveragesSubScreens/trending.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeveragePage extends StatelessWidget {
  final List<Widget> _widget = [BeverageTrending(), SoftDrink(), HardDrink()];

  @override
  Widget build(BuildContext context) {
    final indexprovider = Provider.of<BeverageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Chillious Beverages',
                      style: TextStyle(color: Colors.black, fontSize: 24.0),
                    ),
                    Text('Refresh with a drink',
                        style: TextStyle(fontWeight: FontWeight.w300))
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(right: 20.0),
                    height: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.blue),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BeverageSearchPage()));
                      },
                    ))
              ]),
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FilterChip(
              label: Text(
                'Trending',
                style: TextStyle(color: Colors.black),
              ),
              labelStyle: TextStyle(color: Colors.blue),
              selected: indexprovider.index == 0 ? true : false,
              selectedColor: Colors.blue,
              checkmarkColor: Colors.black,
              onSelected: (bool value) {
                indexprovider.changeIndex(0);
              },
            ),
            SizedBox(width: 5.0),
            FilterChip(
              label: Text(
                'Soft Drinks',
                style: TextStyle(color: Colors.black),
              ),
              labelStyle: TextStyle(color: Colors.blue),
              selected: indexprovider.index == 1 ? true : false,
              selectedColor: Colors.blue,
              checkmarkColor: Colors.black,
              onSelected: (bool value) {
                indexprovider.changeIndex(1);
              },
            ),
            SizedBox(width: 5.0),
            FilterChip(
              label: Text(
                'Hard Drinks',
                style: TextStyle(color: Colors.black),
              ),
              labelStyle: TextStyle(color: Colors.blue),
              selected: indexprovider.index == 2 ? true : false,
              selectedColor: Colors.blue,
              checkmarkColor: Colors.black,
              onSelected: (bool value) {
                indexprovider.changeIndex(2);
              },
            ),
          ]),
          Container(child: _widget[indexprovider.index]),
        ],
      )),
    );
  }
}
