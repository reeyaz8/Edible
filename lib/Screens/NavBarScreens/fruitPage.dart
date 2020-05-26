import 'dart:io';
import 'package:Edible/Provider/Recommender/recommenderImage.dart';
import 'package:Edible/Provider/pathProvider/path.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FruitPage extends StatelessWidget {
  SharedPreferences preferences;
  String path;
  List<String> _list;
  @override
  Widget build(BuildContext context) {
    final recommendDataStatus = Provider.of<ImageRecommendation>(context);
    final getpath = Provider.of<PathProvider>(context);
    path = getpath.fullPath;
    if (recommendDataStatus.fruitRetrieveComplete == true){
    //   getApplicationDocumentsDirectory().then((value) {
    //    path = value.path;
    // });
    SharedPreferences.getInstance().then((value) => preferences = value);
    _list = preferences.getStringList('fruitRecommendation');
    }
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: recommendDataStatus.fruitRetrieveComplete == false ? Container(
        child: CircularProgressIndicator()
      ) : Container(
        height: MediaQuery.of(context).size.height-60.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft:Radius.circular(12.0),
            bottomRight:Radius.circular(12.0)
          )
        ),
        child: SingleChildScrollView(
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
                height: 200.0,
                child: ListView.builder(
                  itemCount:4,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, int index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            width: 150.0,
                            child: Image.file(File(path+'/'+_list[index]), height: 50.0 , width: 50.0,)),
                          Container(
                          height: 100.0,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(right:15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          color: Colors.orange,
                          ),
                          width: 150.0,
                          child: Column(
                            children: <Widget>[
                              Text(
                                preferences.getStringList(_list[index])[0].toString(),
                                style: TextStyle(color: Colors.white, fontSize: 20.0),
                                ),
                              SizedBox(height:5.0),
                              Text('Rs. '+preferences.getStringList(_list[index])[1].toString()+' /kg',
                                style: TextStyle(color: Colors.white, fontSize: 16.0),
                              ),
                              SizedBox(height:5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(icon: Icon(Icons.favorite_border, color: Colors.white,), onPressed: (){}),
                                  IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.white), onPressed: (){}),
                                ],
                              )
                            ],
                          )
                    ),
                        ],
                      );
                  },
                ),
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
              FlatButton(onPressed: (){}, child: Text('See all', style: TextStyle(color: Colors.blue)))
              ],),
              SizedBox(height: 15.0,),
              Container(
                margin: EdgeInsets.only(right:10.0),
                height: MediaQuery.of(context).size.height-450.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, int index){
                    return Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color:Colors.blue
                      ),
                      margin: EdgeInsets.only(right:10.0),
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: Column(children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height - 550,
                              child: Image.asset('images/beer.png')),
                            SizedBox(height: 15.0),
                            Container(
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text('Orange', style: TextStyle(color: Colors.white, fontSize: 20.0))
                              )
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left:5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                Container(child: Text('Rs. 200 /kg', style: TextStyle(fontSize: 15.0 ,color:Colors.white))),
                                IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.white), onPressed: (){})
                              ],),
                            )
                        ],)
                      ),
                    );
                  },
                )
              ),
            SizedBox(height:30.0),
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