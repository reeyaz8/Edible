import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetModalBeverage extends StatelessWidget{
  final String name, price, id, amt, unit, rating, type;
  BottomSheetModalBeverage({Key key, this.type, @required this.name, this.rating, this.price, this.amt, this.unit, this.id});
  @override
  Widget build(BuildContext context) {
  final cartdata = Provider.of<CartData>(context);
  final cartlist = Provider.of<CartPageData>(context);

      return Container(
        color: Color(0xFF737373),
        height: 430.0,
        child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0)
          )
        ),
        child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(name, style: TextStyle(fontSize: 25.0, color: Colors.white),),
          SizedBox(height:3.0),
          rating == '' ? Container() : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star_border, size: 16.0, color: Colors.white),
                  SizedBox(width:3.0),
                  Text(rating, style: TextStyle(fontSize:14.0, fontWeight: FontWeight.w300, color: Colors.white),),
                ],
              ),
          SizedBox(height:5.0),
         Container(
          height: 200.0,
          width: 200.0,
          child: Image.network('https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Beverages%2F'+type+'Beverages%2F'+id+'.png?alt=media')),
          SizedBox(height:10.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                Container(
                  child: Text('Rs. '+cartdata.price.toString(), style: TextStyle(color: Colors.white, fontSize: 20.0),)
                ),
              
              ]
            ),
          ),
          Container(
                  child: Text(amt+' '+unit+' /unit', style: TextStyle(color: Colors.white, fontSize: 14.0),),
                ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
              IconButton(color: Colors.white, icon: Icon(Icons.remove_circle, size: 30.0,), onPressed: (){
                cartdata.decrement();
                cartdata.decrementPrice(int.parse((price)));
              }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Qty: '+cartdata.quantity.toString(), style: TextStyle(color: Colors.white, fontSize: 20.0))),
              IconButton(color: Colors.white, icon: Icon(Icons.add_circle, size: 30.0,), onPressed: (){
                cartdata.increment();
                cartdata.incrementPrice(int.parse(price));
              }),
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
              onPressed: (){
                cartlist.updateCartList(name, cartdata.quantity.toString()+'* '+amt+' '+unit, cartdata.price.toString());
                Navigator.pop(context);
              },
              child: Text('ADD TO CART', style: TextStyle(color: Colors.blue,))
            ),
          ),
        ],
          ),
    ),
      );
  }
}