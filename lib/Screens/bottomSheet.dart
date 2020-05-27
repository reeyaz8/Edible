import 'package:flutter/material.dart';

bottomSheet(BuildContext context, String name, String price, String rating) {
  showModalBottomSheet<void>(
     elevation: 0.0,
     isScrollControlled: true,
      context: context,
      backgroundColor: Colors.grey,
      builder: (BuildContext context) {
            return Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)
              )
            ),
            height: 400.0,
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
                     height: MediaQuery.of(context).size.height / 5,
                     child: Image.asset('images/beer.png')
                     ),
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
                        child: Text('Qty: 2 kg', style: TextStyle(color: Colors.white, fontSize: 20.0))),
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
                        side: BorderSide(color: Colors.red)
                      ),
                      color: Colors.white,
                      onPressed: (){},
                      child: Text('ADD TO CART', style: TextStyle(color: Colors.red,))
                    ),
                  ),
                  SizedBox(height:10.0),
                  Container(
                    child: Text('Description', style: TextStyle(color: Colors.white, fontSize: 18.0))
                  ),
                  SizedBox(height:3.0),
                  Container(
                    decoration: BoxDecoration(
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('vfjnjfkbjfnvkfbkgnbkgnbknbjknbknkbknbbnbnbnbnvnbvcd', 
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    child: Text('Nutritional Value', style: TextStyle(color: Colors.white, fontSize:18.0),),
                  ),
                  Container()
                ],
              ),
            ),
          );
          },
    );
}