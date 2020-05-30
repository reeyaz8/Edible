import 'dart:io';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Provider/Data/overhead.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BottomSheetModal extends StatelessWidget{
  final String name, price, rating, id;
  BottomSheetModal({Key key, @required this.name, this.price, this.rating, this.id});
  @override
  Widget build(BuildContext context) {
  List keys;
  List values;
  final cartdata = Provider.of<CartData>(context);
  final overhead = Provider.of<FruitOverhead>(context);
  final cartlist = Provider.of<CartPageData>(context);
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
                  },
                  child: Text('ADD TO CART', style: TextStyle(color: Colors.blue,))
                ),
              ),
              SizedBox(height:10.0),
              
              Container(
                    child: overhead.hasData == false ? Container(
                      child: CircularProgressIndicator()
                    ) : Column(
                      children: <Widget>[
                          Container(
                            child: Text('Description', style: TextStyle(color: Colors.white, fontSize: 18.0))
                          ),
                          SizedBox(height:5.0),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(overhead.description, textAlign: TextAlign.justify , style: TextStyle(color: Colors.white,)),
                          ),
                          SizedBox(height:20.0),
                          Container(
                            child: Text('Nutritional Value', style: TextStyle(color: Colors.white, fontSize:18.0),),
                          ),
                          SizedBox(height:5.0),
                          Container(
                            height: overhead.nutrition.length * 20.0,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: overhead.nutrition.length,
                              itemBuilder: (context, int index){
                                keys = overhead.nutrition.keys.toList();
                                values = overhead.nutrition.values.toList();
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Text(keys[index], style: TextStyle(color: Colors.white, fontSize: 16.0),)
                                  ),
                                   Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Text(values[index], style: TextStyle(color: Colors.white, fontSize: 16.0),)
                                  ),
                              ],);
                            })
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
              ),
                  ),
            ],
          ),
        ),
    ),
      );
  }
}