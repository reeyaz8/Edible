import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class BeveragePage extends StatefulWidget {
  @override
  _BeveragePageState createState() => _BeveragePageState();
}

class _BeveragePageState extends State<BeveragePage> {
  bool isSoftSelected = false;
  bool isHardSelected = false;
  bool isTeaSelected = false;
  bool isCoffeeSelected = false;
  bool isCokeSelected = false;
  bool isJuiceSelected = false;
  bool isWineSelected = false;
  bool isBeerSelected = false;
  bool isVodkaSelected = false;
  bool isWhiskeySelected = false;
  List<String> _name = ['Tuborg', 'Kingfisher', 'Hinwa', 'Old Durbar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Container(
        child: Column(children: <Widget>[
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text('Chillious Beverages',
                  style: TextStyle(color: Colors.black, fontSize: 24.0),
                ),
                Text('Refresh with a drink',
                  style: TextStyle(fontWeight: FontWeight.w300))
              ],),
              Container(
                      margin: EdgeInsets.only(right: 20.0),
                      height: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.blue
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.search), color: Colors.white, onPressed: () {},)
                )
          ]),
          SizedBox(height:20.0),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,  
          children:<Widget>[
          FilterChip(label: Text('Soft Drinks', style: TextStyle(color: Colors.black),), 
          labelStyle: TextStyle(
            color: Colors.blue
          ),
          selected: isSoftSelected,
          selectedColor: Colors.blue,
          checkmarkColor: Colors.black, 
          onSelected: (bool value) { 
              setState(() {
                isSoftSelected = true;
                isHardSelected = false;
              });
           },
          ),
          SizedBox(width:30.0),
          FilterChip(label: Text('Hard Drinks', style: TextStyle(color: Colors.black),), 
          labelStyle: TextStyle(
            color: Colors.blue
          ),
          selected: isHardSelected,
          selectedColor: Colors.blue,
          checkmarkColor: Colors.black, 
          onSelected: (bool value) { 
              setState(() {
                isHardSelected = true;
                isSoftSelected = false;
              });
           },
          ),
          ]),
          Container(
                      child: (isHardSelected==true || isSoftSelected==true)? Container(
              child: isHardSelected == false ? Row(
            mainAxisAlignment: MainAxisAlignment.center,  
            children:<Widget>[
            FilterChip(label: Text('Tea', style: TextStyle(color: Colors.black)),
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            selected: isTeaSelected,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.black, 
             onSelected: (bool value) { 
                setState(() {
                  isTeaSelected = true;
                  isCoffeeSelected = false;
                  isCokeSelected = false;
                  isJuiceSelected = false;
                });
             },),
            SizedBox(width:8.0),
            FilterChip(label: Text('Coffee',  style: TextStyle(color: Colors.black)), 
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            selected: isCoffeeSelected,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.black, 
             onSelected: (bool value) { 
                setState(() {
                 isTeaSelected = false;
                  isCoffeeSelected = true;
                  isCokeSelected = false;
                  isJuiceSelected = false;
                });
             },),
            SizedBox(width:8.0),
            FilterChip(label: Text('Coke',  style: TextStyle(color: Colors.black)),
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            selected: isCokeSelected,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.black, 
             onSelected: (bool value) { 
                setState(() {
                  isTeaSelected = false;
                  isCoffeeSelected = false;
                  isCokeSelected = true;
                  isJuiceSelected = false;
                });
             },),
            SizedBox(width:8.0),
            FilterChip(label: Text('Juice',  style: TextStyle(color: Colors.black)), 
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            selected: isJuiceSelected,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.black, 
             onSelected: (bool value) { 
                setState(() {
                  isTeaSelected = false;
                  isCoffeeSelected = false;
                  isCokeSelected = false;
                  isJuiceSelected = true;
                });
             },),
            ]):
            Row(
            mainAxisAlignment: MainAxisAlignment.center,  
            children:<Widget>[
            FilterChip(label: Text('Wine',  style: TextStyle(color: Colors.black)), 
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            selected: isWineSelected,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.black, 
             onSelected: (bool value) { 
                setState(() {
                  isWineSelected = true;
                  isBeerSelected = false;
                  isVodkaSelected = false;
                  isWhiskeySelected = false;
                });
             },),
            SizedBox(width:8.0),
             FilterChip(label: Text('Beer',  style: TextStyle(color: Colors.black)), 
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            selected: isBeerSelected,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.black, 
             onSelected: (bool value) { 
                setState(() {
                  isWineSelected = false;
                  isBeerSelected = true;
                  isVodkaSelected = false;
                  isWhiskeySelected = false;
                });
             },),
            SizedBox(width:8.0),
             FilterChip(label: Text('Vodka',  style: TextStyle(color: Colors.black)), 
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            selected: isVodkaSelected,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.black, 
             onSelected: (bool value) { 
                setState(() {
                  isWineSelected = false;
                  isBeerSelected = false;
                  isVodkaSelected = true;
                  isWhiskeySelected = false;
                });
             },),
            SizedBox(width:8.0),
             FilterChip(label: Text('Whiskey',  style: TextStyle(color: Colors.black)), 
            labelStyle: TextStyle(
              color: Colors.blue
            ),
            selected: isWhiskeySelected,
            selectedColor: Colors.blue,
            checkmarkColor: Colors.black, 
             onSelected: (bool value) { 
                setState(() {
                  isWineSelected = false;
                  isBeerSelected = false;
                  isVodkaSelected = false;
                  isWhiskeySelected = true;
                });
             },),
            ])
            ):null,
          ),
          SizedBox(height: 15.0),
          Container(
            alignment: Alignment.topLeft,
            child: Text("Today's Trending", style: TextStyle(fontSize:20.0),)
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text('A new taste to your tongue', style:TextStyle(fontWeight: FontWeight.w300))
          ),
          SizedBox(height:10.0),
          Expanded(
              child: Container(
              margin: EdgeInsets.only(right:8.0),
              height: MediaQuery.of(context).size.height-300.0,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12.0, mainAxisSpacing: 15.0, childAspectRatio: 0.6),
                itemBuilder: (context, int index) {
                  return Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                    color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))
                    ),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height:10.0),
                          Image.asset('images/beer.png', height: 150.0),
                          SizedBox(height:3.0),
                          Container(
                            alignment: Alignment.center,
                            child: Text(_name[index], maxLines: 2, style: TextStyle(color: Colors.white, fontSize: 16.0),)),
                          SizedBox(height: 3.0),
                          Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:<Widget>[
                                  IconButton(icon: Icon(Icons.favorite_border, color: Colors.white), onPressed: () {},),
                                  IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.white), onPressed: () {},),
                                  IconButton(icon: Icon(Icons.arrow_forward, color: Colors.white), onPressed: (){})
                                ]
                              ),
                          ),
                        ],
                      )
                      )
                  );
                }
                )
            ),
          )
        ],
        )
      ),
    );
  }
}