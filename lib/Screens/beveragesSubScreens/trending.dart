import 'package:Edible/Provider/API_Call/BeveragesAPI/trendingPage.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Screens/bottomSheet/bottomSheetBev.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeverageTrending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartdata = Provider.of<CartData>(context);
    final cartlist = Provider.of<CartPageData>(context);
    final dataProvider = Provider.of<BeverageRecommendation>(context);
    dataProvider.hasData == false
        ? dataProvider.retrieveRecommendationData()
        : null;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: dataProvider.hasData == false
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: dataProvider.recommenddata.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.6),
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                        cartdata.initPrice(int.parse(dataProvider.recommenddata[index]['price']));
                        cartdata.initQuantity();
                        showModalBottomSheet(context: (context),
                                      elevation: 0.0,
                                      enableDrag: true,
                                      isScrollControlled: true,
                                      builder: (_) {
                                        return  BottomSheetModalBeverage(
                                          name: dataProvider.recommenddata[index]['name'],
                                          price: dataProvider.recommenddata[index]['price'],
                                          amt: dataProvider.recommenddata[index]['amt'],
                                          unit: dataProvider.recommenddata[index]['unit'],
                                          rating: '',
                                          type: 'soft',
                                          id: dataProvider.recommenddata[index]['_id']);
                                      });
                     
                    },
                    child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        child: Container(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 10.0),
                                Container(
                                    height: 125.0,
                                    width: 100.0,
                                    child: Image.network(
                                        'https://firebasestorage.googleapis.com/v0/b/edible-8888.appspot.com/o/Beverages%2FsoftBeverages%2F' +
                                            dataProvider.recommenddata[index]
                                                ['_id'] +
                                            '.png?alt=media&token=280273e0-ccae-43fb-97a3-afe95a73683e')),
                                SizedBox(height: 3.0),
                                FittedBox(
                                    alignment: Alignment.center,
                                    child: Text(
                                      dataProvider.recommenddata[index]['name'],
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                    )),
                                SizedBox(height: 6.0),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Rs. ' +
                                            dataProvider.recommenddata[index]
                                                ['price'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0),
                                      ),
                                      Text(
                                          dataProvider.recommenddata[index]
                                                  ['amt'] +
                                              ' ' +
                                              dataProvider.recommenddata[index]
                                                  ['unit'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0)),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.favorite_border,
                                              color: Colors.white),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add_shopping_cart,
                                              color: Colors.white),
                                          onPressed: () {
                                              cartlist.updateCartList(dataProvider.recommenddata[index]['name'], '1* '+dataProvider.recommenddata[index]['amt']+' '+dataProvider.recommenddata[index]['unit'], dataProvider.recommenddata[index]['price']);
                                          },
                                        ),
                                      ]),
                                ),
                              ],
                            ))),
                  );
                }),
      ),
    );
  }
}