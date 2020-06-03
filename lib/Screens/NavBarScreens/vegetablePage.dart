import 'package:flutter/material.dart';
class VegetablePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // final e =ImageRetriever().imageRetriever();
    // final i = ImageRetriever().read();
    
  return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
        Container(
              child: Text('Seasonly Diet', style: TextStyle(fontSize: 22.0),)
            ),
            Container(child: Text('New Season, New Taste', 
                style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w300),),)
                ]
              ),
              Container(
                child: IconButton(
        icon: Icon(Icons.search), 
        onPressed: () {}),
              )
            ]),
            SizedBox(height:15.0),
            Container(
              height: 150.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, int index) {
                return Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(12.0))
        ),
        width: MediaQuery.of(context).size.width/3,
        margin: EdgeInsets.only(right:10.0),
        alignment: Alignment.topCenter,
        child: Column(children: <Widget>[
          SizedBox(height:5.0),
          Container(
            width: 90.0,
            child: Image.asset('images/tomato.png')),
          SizedBox(height:5.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:<Widget>[
                IconButton(icon: Icon(Icons.favorite_border, color: Colors.white), onPressed: () {},),
                IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.white), onPressed: () {},),
              ]
            ),
        ),
          Text('Tomato', style: TextStyle(color:Colors.white, fontSize: 18.0), )
        ],)
                );
              },
              )
            ),
            SizedBox(height:15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Column(children: <Widget>[
        Text('Fresh Vegetables', style: TextStyle(fontSize: 25.0)),
        Text('Fill the basket with freshness', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300)),
              ],),
              FlatButton(onPressed: (){
              }, child: Text('See all', style: TextStyle(color: Colors.blue),))
            ],),
            SizedBox(height:15.0),
            Expanded(
              child: Container(
                 margin: EdgeInsets.only(right:10.0),
              height: MediaQuery.of(context).size.height-450.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, int index){
                return Container(
                  margin: EdgeInsets.only(bottom:10.0),
                  padding: EdgeInsets.all(8.0),
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Container(
                      width: 80.0,
                      child: Image.asset('images/tomato.png')),
                    Container(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Cauliflower', style: TextStyle(color:Colors.white, fontSize: 18.0),),
                        Text('Fresh on the House', style: TextStyle(color:Colors.white, fontSize: 12.0, fontWeight: FontWeight.w300))
                    ],)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                      Text('Rs. 200 /kg', style: TextStyle(color:Colors.white, fontSize: 16.0),),
                    IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.white), onPressed: (){})
                    ])
                  ],)
                );
              }),
                    )
                  )

            

          ]
            ),
      )
    );
  }
}


