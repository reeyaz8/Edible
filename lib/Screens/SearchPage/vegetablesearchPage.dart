import 'package:Edible/Provider/API_Call/Vegetable/search.dart';
import 'package:Edible/Provider/Data/bottomSheetData.dart';
import 'package:Edible/Provider/Data/cartData.dart';
import 'package:Edible/Screens/bottomSheet/bottomSheetVeg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VegetableSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchResult = Provider.of<VegetableSearch>(context);
    final cartdata = Provider.of<CartData>(context);
    final cartlist = Provider.of<CartPageData>(context);

    TextEditingController _controller = new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.blue,), padding: EdgeInsets.zero ,onPressed: (){
          Navigator.pop(context);
        }),
        title: TextField(
          controller: _controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          border: new OutlineInputBorder(
          ),
          contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          hintText: 'Search Vegetables'
        ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.blue,), onPressed: (){
                FocusScope.of(context).requestFocus(new FocusNode());
                searchResult.retrieveSearchItem(_controller.text);
          })
        ],
      ),
      body: searchResult.startSearch == true ? Center(
          child: CircularProgressIndicator(), 
      )
       : 
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: searchResult.searchData.length,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:1.0,
                    mainAxisSpacing: 5.0, 
                    crossAxisSpacing: 5.0
                  ),
                itemBuilder: (context, int index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      color: Colors.blue,
                    ),
                    child: Column(children:<Widget>[
                        SizedBox(height: 8.0),
                        Text(searchResult.searchData[index]['name'], style: TextStyle(color: Colors.white, fontSize:20.0),),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          Container(margin: EdgeInsets.only(left:8.0) ,child: Text('Rs. '+searchResult.searchData[index]['price']+' /kg',
                          style: TextStyle(color: Colors.white, fontSize:16.0),)
                          ),
                          IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.white, size: 20.0,), onPressed: (){
                            cartlist.updateCartList(searchResult.searchData[index]['name'], '1' ,searchResult.searchData[index]['price']);
                          })
                        ],
                        ),
                        Container(
                            child: RaisedButton(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)
                              ),
                              color: Colors.white,
                              onPressed: (){
                                  cartdata.initPrice(int.parse(searchResult.searchData[index]['price']));
                                  cartdata.initQuantity();
                                  showModalBottomSheet(context: (context), 
                                    elevation: 0.0,
                                    enableDrag: true,
                                    isScrollControlled: true,
                                    builder: (_) {
                                      return BottomSheetModalVegetable(name: searchResult.searchData[index]['name'], price: searchResult.searchData[index]['price'], id: searchResult.searchData[index]['_id']);
                                    });
                              },
                              child: Text('View Details', style: TextStyle(color: Colors.blue,))
                            ),
                          ),
                    ]
                    ),
                  );
                }),
            ),
          ],
        ),
      )
    );
  }
}