import 'package:Edible/Provider/API_Call/Vegetable/mainPage.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Screens/AllItems/allVegetable.dart';
import 'package:Edible/Screens/SearchPage/vegetablesearchPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VegetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<VegetableRecommendation>(context);
    final cartlist = Provider.of<CartPageData>(context);
    data.hasData == false ? data.retrieveRecommendationData() : null;
    return Scaffold(
        backgroundColor: Colors.white,
        body: data.hasData == false
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'Seasonly Diet',
                                    style: TextStyle(fontSize: 22.0),
                                  )),
                                  Container(
                                    child: Text(
                                      'New Season, New Taste',
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )
                                ]),
                            Container(
                              child: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VegetableSearchPage()));
                                  }),
                            )
                          ]),
                      SizedBox(height: 15.0),
                      Container(
                          height: 210.0,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data.recommenddata.length,
                            itemBuilder: (context, int index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0))),
                                  width: 150.0,
                                  margin: EdgeInsets.only(right: 10.0),
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 5.0),
                                      Container(
                                          height: 100.0,
                                          width: 100.0,
                                          child: Image.network(
                                              'https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Vegetables%2F' +
                                                  data.recommenddata[index]
                                                      ['_id'] +
                                                  '.png?alt=media&token=64dbb74b-1c94-4069-acf2-b94a6ff39ffd')),
                                      SizedBox(height: 5.0),
                                      Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white),
                                                onPressed: () {},
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                    Icons.add_shopping_cart,
                                                    color: Colors.white),
                                                onPressed: () {
                                                  cartlist.updateCartList(
                                                      data.recommenddata[index]
                                                          ['name'],
                                                      "1",
                                                      data.recommenddata[index]
                                                          ['price']);
                                                },
                                              ),
                                            ]),
                                      ),
                                      Text(data.recommenddata[index]['name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0)),
                                      SizedBox(height: 5.0),
                                      Text(
                                        'Rs. ' +
                                            data.recommenddata[index]['price'] +
                                            ' /kg',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0),
                                      )
                                    ],
                                  ));
                            },
                          )),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('Fresh Vegetables',
                                  style: TextStyle(fontSize: 25.0)),
                              Text('Fill the basket with freshness',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                          FlatButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AllVegetable()));
                              },
                              child: Text(
                                'See all',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        height: MediaQuery.of(context).size.height - 450.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: data.saledata.length,
                            itemBuilder: (context, int index) {
                              return Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  padding: EdgeInsets.all(8.0),
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                          height: 100.0,
                                          width: 100.0,
                                          child: Image.network(
                                              'https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Vegetables%2F' +
                                                  data.saledata[index]['_id'] +
                                                  '.png?alt=media&token=64dbb74b-1c94-4069-acf2-b94a6ff39ffd')),
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            data.saledata[index]['name'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0),
                                          ),
                                        ],
                                      )),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Rs. ' +
                                                  data.saledata[index]
                                                      ['price'] +
                                                  ' /kg',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0),
                                            ),
                                            IconButton(
                                                icon: Icon(
                                                    Icons.add_shopping_cart,
                                                    color: Colors.white),
                                                onPressed: () {})
                                          ])
                                    ],
                                  ));
                            }),
                      ))
                    ]),
              ));
  }
}
