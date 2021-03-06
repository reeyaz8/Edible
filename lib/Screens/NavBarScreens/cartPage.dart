import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Provider/Data/navRailIndex.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartlist = Provider.of<CartPageData>(context);
    final navrailIndex = Provider.of<NavRailIndex>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        SizedBox(height: 30.0),
        Container(
          height: MediaQuery.of(context).size.height - 120.0,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text('My Cart', style: TextStyle(fontSize: 22.0)),
              ),
              SizedBox(height: 20.0),
              Expanded(
                  child: cartlist.listData.length == 0
                      ? Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                              Text('You have no any item added to cart'),
                              SizedBox(height: 20.0),
                              RaisedButton(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  onPressed: () {
                                    navrailIndex.changeIndex(2);
                                  },
                                  child: Text('Explore'))
                            ]))
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: cartlist.listData.length,
                          itemBuilder: (context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue
                              ),
                              padding: EdgeInsets.all(8.0),
                              margin: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width - 130.0,
                                    child: Column(children: <Widget>[
                                      FittedBox(child: Text(cartlist.listData[index]['fullName'], style: TextStyle(fontSize: 16.0, color: Colors.white))),
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text('Rs. '+cartlist.listData[index]['price'], style: TextStyle(fontSize: 14.0, color: Colors.white)),
                                          Text(cartlist.listData[index]['quantity'], style: TextStyle(fontSize: 14.0, color: Colors.white)),
                                        ],
                                      ),
                                    ],),
                                  ),
                                IconButton(icon: Icon(Icons.delete, color: Colors.white), onPressed: (){
                                  cartlist.deleteCartList(
                                                index,
                                                cartlist.listData[index]
                                                    ['price']);
                                },)
                                ],
                              )
                            );
                          }))
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Container(
              height: 65.0,
              width: MediaQuery.of(context).size.width - 55.0,
              color: Colors.deepOrange,
              child: Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Total', style: TextStyle(fontSize: 16.0)),
                              Text(
                                'Rs. ' + cartlist.checkOutPrice.toString(),
                                style: TextStyle(fontSize: 22.0),
                              )
                            ]),
                      ),
                      Container(
                          child: RaisedButton.icon(
                              onPressed: () {},
                              padding: EdgeInsets.only(left: 20.0, right: 20.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              color: Colors.blue,
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Checkout',
                                style: TextStyle(color: Colors.white),
                              )))
                    ]),
              )),
        )
      ]),
    );
  }
}