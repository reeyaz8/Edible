import 'dart:async';
import 'dart:io';
import 'package:Edible/Provider/Data/allFruit.dart';
import 'package:Edible/Provider/Data/mainPage.dart';
import 'package:Edible/Provider/Data/overhead.dart';
import 'package:Edible/Screens/AllItems/allFruit.dart';
import 'package:Edible/Screens/bottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FruitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FruitRecommendation>(context);
    final overhead = Provider.of<FruitOverhead>(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: data.hasData == false ? Center(
        child: CircularProgressIndicator()
      ) : 
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft:Radius.circular(12.0),
            bottomRight:Radius.circular(12.0)
          )
        ),
        child: 
        SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
            children: <Widget>[
              SizedBox(height:30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        Container(
                          child: Text('Exotic Fruits',
                           style: TextStyle(color: Colors.black, fontSize: 28.0),),
                        ),
                        Container(
                          child: Text('More than 70 exotic fruits',
                          style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ]
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 20.0),
                        height: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.yellowAccent
                        ),
                        child: IconButton(icon: Icon(Icons.search), color: Colors.grey, onPressed: () {},)
                  )
                ],
              ),
              SizedBox(height:30.0),
            Container(
                margin: EdgeInsets.only(right:10.0),
                height: MediaQuery.of(context).size.height-450.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView.builder(
                  key: PageStorageKey<String>('recommend'),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.recommenddata.length,
                  itemBuilder: (context, int index){
                    return Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color:Colors.blue
                      ),
                      margin: EdgeInsets.only(right:10.0),
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: (){
                            overhead.retrieveOverheadData(data.recommenddata[index]['_id']);
                            showModalBottomSheet(context: (context), 
                            elevation: 0.0,
                            enableDrag: true,
                            isScrollControlled: true,
                            builder: (_) {
                            return bottomSheet(context, data.recommenddata[index]['fullName'], data.recommenddata[index]['price'], data.recommenddata[index]['rating'], data.recommenddata[index]['_id']);
                            });
                            },
                          child: Container(
                          child: Column(children: <Widget>[
                              Container(
                                height: 100.0,
                                width: 100.0,
                                child: Image.file(File('/data/data/com.example.Edible/app_flutter/Fruits'+'/'+data.recommenddata[index]['_id']))),
                              SizedBox(height: 15.0),
                              Container(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(data.recommenddata[index]['fullName'], style: TextStyle(color: Colors.white, fontSize: 20.0))
                                )
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left:5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Container(child: Text('Rs. '+data.recommenddata[index]['price']+ ' /kg', style: TextStyle(fontSize: 15.0 ,color:Colors.white))),
                                  IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.white), onPressed: (){})
                                ],
                                ),
                              )
                          ],
                          )
                        ),
                      ),
                    );
                  },
                )
              ),
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
                child: Text('Hot Sales', style: TextStyle(fontSize:26.0),)
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text('Now we are in your hometown', style: TextStyle(fontWeight: FontWeight.w300))
              ),
                ],),
              FlatButton(onPressed: (){
                  final fruitData = Provider.of<AllFruitData>(context, listen: false);
                  fruitData.getPartialFruitData('0', '10');
                  Navigator.push(context, MaterialPageRoute(builder: (_) => AllFruit()));
              }, child: Text('See all', style: TextStyle(color: Colors.blue)))
              ],),
              SizedBox(height: 15.0,),
              Container(
                margin: EdgeInsets.only(right:10.0),
                height: MediaQuery.of(context).size.height-450.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView.builder(
                  key: PageStorageKey<String>("hotsale"),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.saledata.length,
                  itemBuilder: (context, int index){
                    return Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color:Colors.blue
                      ),
                      margin: EdgeInsets.only(right:10.0),
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                          onTap: (){
                            overhead.retrieveOverheadData(data.saledata[index]['_id']);
                            showModalBottomSheet(context: (context), 
                            elevation: 0.0,
                            enableDrag: true,
                            isScrollControlled: true,
                            builder: (_) {
                            return bottomSheet(context, data.saledata[index]['fullName'], data.saledata[index]['price'], data.saledata[index]['rating'], data.saledata[index]['_id']);
                            });
                          },
                          child: Container(
                          child: Column(children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height - 550,
                                child: Image.file(File('/data/data/com.example.Edible/app_flutter/Fruits'+'/'+data.saledata[index]['_id']))),
                              SizedBox(height: 15.0),
                              Container(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(data.saledata[index]['fullName'], style: TextStyle(color: Colors.white, fontSize: 20.0))
                                )
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(left:5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Container(child: Text('Rs. '+data.saledata[index]['price']+' /kg', style: TextStyle(fontSize: 15.0 ,color:Colors.white))),
                                  IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.white), onPressed: (){})
                                ],),
                              )
                          ],)
                        ),
                      ),
                    );
                  },
                )
              ),
            SizedBox(height:100.0),
            ],
          ),
        ),
      ),
      
      bottomSheet: Container(
        margin: EdgeInsets.only(left:5.0),
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0)
          )
        ),
        child: Column(children:<Widget>[
          SizedBox(height:4.0),
          Container(
            child: Text("Today's Offer", style: TextStyle(fontSize:16.0),)
          ),
          SizedBox(height:4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Text('1 kg Apple + 1 kg Orange'),
            Text('Rs. 100'),
            GestureDetector(
              onTap: (){
                print('added to cart');
              },
              child: Icon(Icons.add_shopping_cart, size: 26.0,))
          ],)
        ])
      ),
    );
  }
}