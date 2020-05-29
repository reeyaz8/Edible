import 'dart:async';

import 'package:Edible/Provider/Data/allFruit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllFruit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fruitData = Provider.of<AllFruitData>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.blue,), onPressed: (){ Navigator.pop(context);}),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Fruit List', style: TextStyle(color: Colors.blue),)
      ),

      body: fruitData.isLoading == false ? Center(
        child: CircularProgressIndicator()) 
        :
        GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:0.7,
            mainAxisSpacing: 5.0 
          ), 
          itemBuilder: (context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))
              ),
              child: Column(children: <Widget>[
                Container(
                  width: 100.0,
                  height: 125.0,
                  child: Image.asset('images/beer.png')
                ),
                SizedBox(height:8.0),
                Text('Apple',
                style: TextStyle(color: Colors.white, fontSize:18.0),),
                SizedBox(height:5.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:8.0),
                        child: Text('Rs. 200 /kg', style: TextStyle(color: Colors.white, fontSize: 16.0),)),
                      IconButton(icon: Icon(Icons.favorite, color: Colors.white,), onPressed: null)
                  ],),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
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
                      child: Text('ADD TO CART', style: TextStyle(color: Colors.red,))
                    ),
                  ),
              ],
              )
            );
          })
      );
    }
}