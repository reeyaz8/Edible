import 'dart:io';

import 'package:Edible/Provider/Data/overhead.dart';
import 'package:flutter/material.dart';

bottomSheet(BuildContext context, String name, String price, String rating, String id) {
  List keys;
  List values;
      return Container(
        color: Color(0xFF737373),
        height: 475.0,
        child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0)
          )
        ),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              Text(name, style: TextStyle(fontSize: 25.0, color: Colors.white),),
              SizedBox(height:3.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star_border, size: 16.0, color: Colors.white),
                  SizedBox(width:3.0),
                  Text(rating, style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w300, color: Colors.white),),
                ],
              ),
              SizedBox(height:5.0),
              Container(
                  height: MediaQuery.of(context).size.height / 4.5,
                  child: Image.file(File('/data/data/com.example.Edible/app_flutter/Fruits'+'/'+id)),
                  ),
              SizedBox(height:10.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Container(
                      child: Text('Rs. '+price, style: TextStyle(color: Colors.white, fontSize: 20.0),)
                    )
                  ]
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                  IconButton(color: Colors.white, icon: Icon(Icons.remove_circle, size: 30.0,), onPressed: (){}),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Qty: 1 kg', style: TextStyle(color: Colors.white, fontSize: 20.0))),
                  IconButton(color: Colors.white, icon: Icon(Icons.add_circle, size: 30.0,), onPressed: (){}),
                ]),
              ),
              SizedBox(height:10.0),
              Container(
                width: MediaQuery.of(context).size.width - 70.0,
                child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)
                  ),
                  color: Colors.white,
                  onPressed: (){},
                  child: Text('ADD TO CART', style: TextStyle(color: Colors.blue,))
                ),
              ),
              SizedBox(height:10.0),
              
              SizedBox(height:3.0),
              Container(
                child: Column(children: <Widget>[
                  Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                ),
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                child: FutureBuilder(
                    future: FruitOverhead().retrieveOverheadData(id),
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        keys = snapshot.data['nutrition'].keys.toList();
                        values = snapshot.data['nutrition'].values.toList();
                      }
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                      }
                      return Column(
                        children: <Widget>[
                            Container(
                              child: Text('Description', style: TextStyle(color: Colors.white, fontSize: 18.0))
                            ),
                            SizedBox(height:5.0),
                            Container(
                                child: Text(snapshot.data['description'], textAlign: TextAlign.justify , style: TextStyle(color: Colors.white,)),
                            ),
                            SizedBox(height:20.0),
                            Container(
                              child: Text('Nutritional Value', style: TextStyle(color: Colors.white, fontSize:18.0),),
                            ),
                            SizedBox(height:5.0),
                            Container(
                              height: keys.length*20.0,
                              child: ListView.builder(
                                itemCount: keys.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, int index) {
                                return Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                   children: <Widget>[
                                      Container(
                                        child: Text(keys[index], style: TextStyle(color: Colors.white),),),
                                      Container(
                                        child: Text(values[index],  style: TextStyle(color: Colors.white),),),
                                   ],
                                  ),
                                );
                              }),

                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 70.0,
                                child: RaisedButton(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)
                                  ),
                                  color: Colors.white,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text('Close', style: TextStyle(color: Colors.red,))
                                ),
                              ),
                        ],
                      );
                    },
                )
              ),
                ],
                )
              ),
            ],
          ),
        ),
    ),
      );
}

