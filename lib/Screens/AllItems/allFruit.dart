import 'dart:io';
import 'package:Edible/Provider/Data/allFruit.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Provider/Data/overhead.dart';
import 'package:Edible/Screens/bottomsheet.dart';
import 'package:Edible/Screens/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
class AllFruit extends StatelessWidget {
  static int _skip = Random().nextInt(11);
  static int _limit = 4;
  @override
  Widget build(BuildContext context) {
    final fruitData = Provider.of<AllFruitData>(context);
    final overhead = Provider.of<FruitOverhead>(context);
    final cartdata = Provider.of<CartData>(context);
    final cartlist = Provider.of<CartPageData>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.blue,), onPressed: (){ Navigator.pop(context);}),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Fruit List', style: TextStyle(color: Colors.blue),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.blue), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
          })
        ],
      ),

      body: fruitData.isLoading == false ? Center(
        child: CircularProgressIndicator()) 
        :
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo){
            if(fruitData.changeLoadingState == false && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent){
              fruitData.getPartialFruitData(_skip.toString(), _limit.toString());
            }
            return true;
          },
            child:Column(
              children: <Widget>[
                Expanded(
                  child: GridView.builder(
                  key: PageStorageKey('allfruitlist'),
                  physics: BouncingScrollPhysics(),
                  itemCount: fruitData.newList.length,
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
                      child: GestureDetector(
                          onTap: (){
                            overhead.retrieveOverheadData(fruitData.newList[index]['_id']);
                            cartdata.initPrice(int.parse(fruitData.newList[index]['price']));
                            cartdata.initQuantity();
                            showModalBottomSheet(context: (context), 
                            elevation: 0.0,
                            enableDrag: true,
                            isScrollControlled: true,
                            builder: (_) {
                              return BottomSheetModal(name: fruitData.newList[index]['fullName'], price: fruitData.newList[index]['price'], rating:fruitData.newList[index]['rating'], id: fruitData.newList[index]['_id']);
                            });
                          },
                          child: Column(children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 125.0,
                            child: Image.file(File('/data/data/com.example.Edible/app_flutter/Fruits'+'/'+fruitData.newList[index]['_id'])),
                          ),
                          SizedBox(height:8.0),
                          Text(fruitData.newList[index]['fullName'],
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
                                  child: Text('Rs. '+fruitData.newList[index]['price']+' /kg', style: TextStyle(color: Colors.white, fontSize: 16.0))
                                  ),
                                IconButton(icon: Icon(Icons.favorite, color: Colors.white,), onPressed: () {
                                  print('Added to Favorites');
                                })
                            ],
                            ),
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
                                  cartlist.updateCartList(fruitData.newList[index]['fullName'], '1', fruitData.newList[index]['price']);
                                },
                                child: Text('ADD TO CART', style: TextStyle(color: Colors.red,))
                              ),
                            ),
                        ],
                        ),
                      )
                    );
                  }),
                ),
                Container(
                  child: fruitData.changeLoadingState == true ? Text('Loading...'): null,
                )
              ],
            ),
        )
      );
    }
}

