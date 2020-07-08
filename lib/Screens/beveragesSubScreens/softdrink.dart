import 'dart:math';
import 'package:Edible/Provider/API_Call/BeveragesAPI/softBeverage.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Screens/bottomSheet/bottomSheetBev.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoftDrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartlist = Provider.of<CartPageData>(context);
    final cartdata = Provider.of<CartData>(context);
    final beverageData = Provider.of<AllSoftBeverageData>(context);
    beverageData.isLoading == false ? beverageData.getPartialBeverageData('2', '6') : null;
    if (beverageData.isLoading == false) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Container(
        height: MediaQuery.of(context).size.height - 170.0,
        child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
            if (beverageData.changeLoadingState == false &&
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              beverageData.getPartialBeverageData(
                  Random().nextInt(11).toString(), Random().nextInt(4).toString());
            }
            return true;
          },
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GridView.builder(
                    itemCount: beverageData.newList.length,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        childAspectRatio: 0.6),
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                            onTap: (){
                                cartdata.initPrice(int.parse(beverageData.newList[index]['price']));
                                cartdata.initQuantity();
                                showModalBottomSheet(context: (context),
                                    elevation: 0.0,
                                    enableDrag: true,
                                    isScrollControlled: true,
                                    builder: (_) {
                                      return  BottomSheetModalBeverage(
                                        name: beverageData.newList[index]['name'],
                                        price: beverageData.newList[index]['price'],
                                        amt: beverageData.newList[index]['amt'],
                                        unit: beverageData.newList[index]['unit'],
                                        rating: '',
                                        type: 'soft',
                                        id: beverageData.newList[index]['_id']);
                                    });
                            },
                            child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 8.0),
                                  Container(
                                      height: 110.0,
                                      width: 100.0,
                                      child: Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Beverages%2FsoftBeverages%2F' +
                                              beverageData.newList[index]['_id']
                                                +
                                              '.png?alt=media&token=280273e0-ccae-43fb-97a3-afe95a73683e')),
                                SizedBox(height: 8.0),
                                FittedBox(
                                    child: Text(beverageData.newList[index]['name'],
                                        style: TextStyle(
                                            fontSize: 18.0, color: Colors.white))),
                                SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text('Rs.'+beverageData.newList[index]['price'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16.0)),
                                    Text(beverageData.newList[index]['amt']+' '+beverageData.newList[index]['unit'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16.0))
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.favorite_border,
                                            color: Colors.white),
                                        onPressed: () {}),
                                    IconButton(
                                        icon: Icon(Icons.add_shopping_cart,
                                            color: Colors.white),
                                        onPressed: () {
                                          cartlist.updateCartList(beverageData.newList[index]['name'], '1 unit', beverageData.newList[index]['price']);
                                        })
                                  ],
                                ),
                              ],
                            )),
                      );
                    }),
                ),
                  Container(
                    child: beverageData.changeLoadingState == true ? Text('Loading...'): null,
            )
              ],
            ),
        ),
      );
    }
  }
}
