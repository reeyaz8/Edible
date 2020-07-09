import 'dart:async';
import 'dart:math';
import 'package:Edible/Provider/API_Call/Fruit/allFruit.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Provider/API_Call/Fruit/mainPage.dart';
import 'package:Edible/Provider/API_Call/Fruit/overhead.dart';
import 'package:Edible/Screens/AllItems/allFruit.dart';
import 'package:Edible/Screens/bottomSheet/bottomsheet.dart';
import 'package:Edible/Screens/SearchPage/fruitsearchPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FruitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FruitRecommendation>(context);
    final overhead = Provider.of<FruitOverhead>(context);
    final cartdata = Provider.of<CartData>(context);
    final cartlist = Provider.of<CartPageData>(context);
    data.hasData == false ? data.retrieveRecommendationData() : null;

    return Scaffold(
      backgroundColor: Colors.white,
      body: data.hasData == false
          ? Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Exotic Fruits',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 28.0),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'More than 70 exotic fruits',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ),
                            ]),
                        Container(
                            margin: EdgeInsets.only(right: 20.0),
                            height: 40.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Colors.yellowAccent),
                            child: IconButton(
                              icon: Icon(Icons.search),
                              color: Colors.grey,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchPage()));
                              },
                            ))
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Container(
                        margin: EdgeInsets.only(right: 10.0),
                        height: MediaQuery.of(context).size.height - 450.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListView.builder(
                          key: PageStorageKey<String>('recommend'),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.recommenddata.length,
                          itemBuilder: (context, int index) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  color: Colors.blue),
                              margin: EdgeInsets.only(right: 10.0),
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () {
                                  overhead.retrieveOverheadData(
                                      data.recommenddata[index]['_id']);
                                  cartdata.initPrice(int.parse(
                                      data.recommenddata[index]['price']));
                                  cartdata.initQuantity();

                                  Future(() => showModalBottomSheet(
                                      context: (context),
                                      elevation: 0.0,
                                      enableDrag: true,
                                      isScrollControlled: true,
                                      builder: (_) {
                                        return BottomSheetModal(
                                            name: data.recommenddata[index]
                                                ['fullName'],
                                            price: data.recommenddata[index]
                                                ['price'],
                                            rating: data.recommenddata[index]
                                                ['rating'],
                                            id: data.recommenddata[index]
                                                ['_id']);
                                      }));
                                },
                                child: Container(
                                    child: Column(
                                  children: <Widget>[
                                    Container(
                                        height: 100.0,
                                        width: 100.0,
                                        child: Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Fruits%2F' +
                                                data.recommenddata[index]
                                                    ['_id'] +
                                                '.png?alt=media&token=280273e0-ccae-43fb-97a3-afe95a73683e')),
                                    SizedBox(height: 15.0),
                                    Container(
                                        alignment: Alignment.center,
                                        child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                                data.recommenddata[index]
                                                    ['fullName'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0)))),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                              child: Text(
                                                  'Rs. ' +
                                                      data.recommenddata[index]
                                                          ['price'] +
                                                      ' /kg',
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.white))),
                                          IconButton(
                                              icon: Icon(
                                                  Icons.add_shopping_cart,
                                                  color: Colors.white),
                                              onPressed: () {
                                                cartlist.updateCartList(
                                                    data.recommenddata[index]
                                                        ['fullName'],
                                                    '1 Kg',
                                                    data.recommenddata[index]
                                                        ['price']);
                                              })
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                              ),
                            );
                          },
                        )),
                    Container(
                      child: SizedBox(height: 25.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Hot Sales',
                                  style: TextStyle(fontSize: 26.0),
                                )),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text('Now we are in your hometown',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300))),
                          ],
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AllFruit()));
                            },
                            child: Text('See all',
                                style: TextStyle(color: Colors.blue)))
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10.0),
                        height: MediaQuery.of(context).size.height - 450.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListView.builder(
                          key: PageStorageKey<String>("hotsale"),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.saledata.length,
                          itemBuilder: (context, int index) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  color: Colors.blue),
                              margin: EdgeInsets.only(right: 10.0),
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () {
                                  overhead.retrieveOverheadData(
                                      data.saledata[index]['_id']);
                                  cartdata.initPrice(
                                      int.parse(data.saledata[index]['price']));
                                  cartdata.initQuantity();
                                  showModalBottomSheet(
                                      context: (context),
                                      elevation: 0.0,
                                      enableDrag: true,
                                      isScrollControlled: true,
                                      builder: (_) {
                                        return BottomSheetModal(
                                            name: data.saledata[index]
                                                ['fullName'],
                                            price: data.saledata[index]
                                                ['price'],
                                            rating: data.saledata[index]
                                                ['rating'],
                                            id: data.saledata[index]['_id']);
                                      });
                                },
                                child: Container(
                                    child: Column(
                                  children: <Widget>[
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height -
                                                550,
                                        child: Image.network(
                                            'https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Fruits%2F' +
                                                data.saledata[index]['_id'] +
                                                '.png?alt=media&token=280273e0-ccae-43fb-97a3-afe95a73683e')),
                                    SizedBox(height: 15.0),
                                    Container(
                                        alignment: Alignment.center,
                                        child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                                data.saledata[index]
                                                    ['fullName'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.0)))),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                              child: Text(
                                                  'Rs. ' +
                                                      data.saledata[index]
                                                          ['price'] +
                                                      ' /kg',
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.white))),
                                          IconButton(
                                              icon: Icon(
                                                  Icons.add_shopping_cart,
                                                  color: Colors.white),
                                              onPressed: () {
                                                cartlist.updateCartList(
                                                    data.saledata[index]
                                                        ['fullName'],
                                                    '1 Kg',
                                                    data.saledata[index]
                                                        ['price']);
                                              })
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                              ),
                            );
                          },
                        )),
                    SizedBox(height: 100.0),
                  ],
                ),
              ),
            ),
      bottomSheet: Container(
          margin: EdgeInsets.only(left: 5.0),
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0))),
          child: Column(children: <Widget>[
            SizedBox(height: 4.0),
            Container(
                child: Text(
              "Today's Offer",
              style: TextStyle(fontSize: 16.0),
            )),
            SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('1 kg Apple + 1 kg Orange'),
                Text('Rs. 100'),
                GestureDetector(
                    onTap: () {
                      cartlist.updateCartList('Fruit Offer', '-', '100');
                    },
                    child: Icon(
                      Icons.add_shopping_cart,
                      size: 26.0,
                    ))
              ],
            )
          ])),
    );
  }
}
