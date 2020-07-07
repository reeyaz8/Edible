import 'package:Edible/Provider/API_Call/Vegetable/allVegetable.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Screens/bottomSheet/bottomSheetVeg.dart';
import 'package:Edible/Screens/bottomSheet/bottomsheet.dart';
import 'package:Edible/Screens/SearchPage/vegetablesearchPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
class AllVegetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vegetableData = Provider.of<AllVegetableData>(context);
    final cartdata = Provider.of<CartData>(context);
    final cartlist = Provider.of<CartPageData>(context);
    vegetableData.isLoading == false ? vegetableData.getPartialVegetableData('2', '6'):null;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.blue,), onPressed: (){ Navigator.pop(context);}),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Vegetable', style: TextStyle(color: Colors.blue),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.blue), onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => VegetableSearchPage()));
          })
        ],
      ),

      body: vegetableData.isLoading == false ? Center(
        child: Text('gbgfn')) 
        :
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo){
            if(vegetableData.changeLoadingState == false && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent){
              vegetableData.getPartialVegetableData(Random().nextInt(11).toString(), Random().nextInt(4).toString());
            }
            return true;
          },
            child:Column(
              children: <Widget>[
                Expanded(
                  child: GridView.builder(
                  key: PageStorageKey('allvegetablelist'),
                  physics: BouncingScrollPhysics(),
                  itemCount: vegetableData.newList.length,
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
                            cartdata.initPrice(int.parse(vegetableData.newList[index]['price']));
                            cartdata.initQuantity();
                            showModalBottomSheet(context: (context), 
                            elevation: 0.0,
                            enableDrag: true,
                            isScrollControlled: true,
                            builder: (_) {
                              return BottomSheetModalVegetable(name: vegetableData.newList[index]['name'], price: vegetableData.newList[index]['price'], id: vegetableData.newList[index]['_id']);
                            });
                          },
                          child: Column(children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 125.0,
                            child: Image.network(
                                    'https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Vegetables%2F'+vegetableData.newList[index]['_id']+'.png?alt=media&token=280273e0-ccae-43fb-97a3-afe95a73683e'
                            ),
                          ),
                          SizedBox(height:8.0),
                          Text(vegetableData.newList[index]['name'],
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
                                  child: Text('Rs. '+vegetableData.newList[index]['price']+' /kg', style: TextStyle(color: Colors.white, fontSize: 16.0))
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
                                  cartlist.updateCartList(vegetableData.newList[index]['name'], '1', vegetableData.newList[index]['price']);
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
                  child: vegetableData.changeLoadingState == true ? Text('Loading...'): null,
                )
              ],
            ),
        )
      );
    }
}

