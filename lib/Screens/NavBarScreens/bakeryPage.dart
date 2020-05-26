import 'package:flutter/material.dart';

class BakeryPage extends StatelessWidget {
  int itemCountinNewList = 2;
  final List<String> basketItem = ['Muffins', 'Bread', 'Brownie', 'Cake', 'Cookie', 'Cracker', 'Pastry', 'Pie'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(height: 30.0),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text('Delicious Bake Collections',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                Text('Break the Cake',
                  style: TextStyle(fontWeight: FontWeight.w300))
              ]
              ),
              SizedBox(width:8.0),
              Container(
                      margin: EdgeInsets.only(right: 20.0),
                      height: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.purple
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.search), color: Colors.white, onPressed: () {},)
                )
            ]
          ),
          SizedBox(height: 20.0),
          Container(
            alignment: Alignment.centerLeft,
              child: Text("What's new today?", style: TextStyle(fontSize:18.0),),
          ),
          Container(alignment: Alignment.centerLeft,
            child: Text("Taste the new recipe everyday from our chef's", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),),
          ),
          SizedBox(height: 8.0,),
          Container(
            height: itemCountinNewList*80.0,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemCountinNewList,
              itemBuilder: (context, int index){
              return Card(
                color: Colors.purple,
                child: ListTile(
                  title: Text('American Muffin'),
                  subtitle: Text('Muffin from america to your hand'),
                ),
              );
            })
            ),
          SizedBox(height: 15.0,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Our Basket', style: TextStyle(fontSize:20.0),)
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('Crunchy Cracker to Chocolaty Cake', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300)),
          ),
          SizedBox(height:4.0),
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: basketItem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              itemBuilder: (context, int index) {
                return Card(
                  color: Colors.blue,
                  child: ListTile(
                    title: Container(
                      margin: EdgeInsets.only(bottom:10.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(basketItem[index]))
                  ),
                );
              })
          )
          ]
      )
      )
    );
  }
}