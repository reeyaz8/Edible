import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BottomSheetModalVegetable extends StatelessWidget{
  final String name, price, id;
  BottomSheetModalVegetable({Key key, @required this.name, this.price, this.id});
  @override
  Widget build(BuildContext context) {
  final cartdata = Provider.of<CartData>(context);
  final cartlist = Provider.of<CartPageData>(context);

      return Container(
        color: Color(0xFF737373),
        height: 410.0,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.star_border, size: 16.0, color: Colors.white),
              SizedBox(width:3.0),
            ],
          ),
          SizedBox(height:5.0),
         Container(
          height: 200.0,
          width: 200.0,
          child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Vegetables%2F' +id+
                  '.png?alt=media&token=64dbb74b-1c94-4069-acf2-b94a6ff39ffd')),
          SizedBox(height:10.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                Container(
                  child: Text('Rs. '+cartdata.price.toString(), style: TextStyle(color: Colors.white, fontSize: 20.0),)
                )
              ]
            ),
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
                child: Text('Qty: '+cartdata.quantity.toString()+' kg', style: TextStyle(color: Colors.white, fontSize: 20.0))),
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
                cartlist.updateCartList(name, cartdata.quantity.toString(), cartdata.price.toString());
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