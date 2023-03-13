import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../models/get/all_data_model.dart';

class AllDataPage extends StatefulWidget {
  @override
  State<AllDataPage> createState() => _AllDataPageState();
}

class _AllDataPageState extends State<AllDataPage> {
  Future<AllDataModel> getAllDataAPI() async {
    final response = await http.get(Uri.parse(kAllDataURL));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return AllDataModel.fromJson(data);
    } else {
      return AllDataModel.fromJson(data);
    }
  }

   Widget saleText(bool onsale) {
    if (onsale) {
      // data[data_i].on_sale
      return TextAnimator(
        atRestEffect: WidgetRestingEffects.pulse(duration: Duration(milliseconds: 800)),
        "SALE",
        style: TextStyle(fontWeight: FontWeight.bold, color: kRed),
      );
    } else {
      return 
      Text("SALE",
          style:
              kTextDisable);
    }
  }


  @override
  Widget build(BuildContext context) {
    HeightWidth(context);
    return Scaffold(
      appBar: appBar("All Data API"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              Expanded(
                child: FutureBuilder<AllDataModel>(
                  future: getAllDataAPI(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: ((context, data_i) {
                          // index of data array
                          final _data = snapshot.data!.data![data_i];
// DATA INDEX HERE
                          return Column(
                            children: [
// Continue From Here After API ========================================
                              Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  height: h * 0.6,
                  width: w * 0.9,
                  decoration: BoxDecoration(
                    boxShadow: [kShadow],
                      color: kBlue1, borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: kBlue2,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: ListTile(

                          leading: CircleAvatar(
                            backgroundImage: NetworkImage( // Categories.image
                                _data.categories!.image!), 
                          ),
                          title: Text(
                            _data.shop!.name.toString().toUpperCase(),
                            textAlign: kTextCenter,
                            style: kTextbold,
                          ),
                          subtitle: Text(
                            _data.shop!.description.toString(),
                            textAlign: kTextCenter,
                          ),
                          trailing: IconButton(
                            // is_wishlist
                            color: _data.inWishlist! ? kBlueMain : null,
                            icon: Icon(_data.inWishlist!
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                _data.inWishlist = !_data.inWishlist!;
                              });
                            },
                          ),
                        ),
                      ),

                      0.03.ph,
// Images List here
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        height: h * 0.26,
                        width: w * 1,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.data![data_i].images!.length,
                          itemBuilder: ((context, images_i) {

                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 8.0),
                                  height: h * 0.2,
                                  width: w * 0.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          _data.images![images_i].url.toString()
                                        ),
                                      )),
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 5.0),
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: kBlue2),
                                    child: Text(
                                      _data.images![images_i].sId.toString(),
                                      style: TextStyle(fontSize: 12.0),
                                    )),
                              ],
                            );
                          }),
                        ),
                      ),
// After 2nd ListView ----------------
                      Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Rs.'+_data.price.toString() ,style: kTextDisable,), // data[data_i].price
                          
                          Text('Rs.'+_data.salePrice.toString() ,  // data[data_i].sale_price
                          style: TextStyle(color: kBlueMain, fontWeight: FontWeight.bold, fontSize: 16.0),), 
                          
                          // 0.15.pw,

                           saleText(_data.onSale!), 
                          
                          WidgetAnimator(
                            atRestEffect: WidgetRestingEffects.swing(effectStrength: 5.0),
                            child: Container(
                                padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                    color: kTransparent,
                                    border: Border.all(
                                        width: 2, color: Colors.green)),
                                child: Text(
                                  _data.saleTitle.toString(),
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only( top: 11.0 ,left: 10.0),
                        alignment: Alignment.centerLeft,
                        child: Text(kDescription, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),)),

                      Container(
                        padding: EdgeInsets.all(8.0),  // data[data_i].description
                        child: Text( _data.description.toString(),
                        style: TextStyle(fontSize: 12.0), ),
                      ),
                    ],
                  )),
                            ],
                          );
                        }),
                      );
                    } else {
                      return Text(kLoading);
                    }
                  }),
                ),
              ),
  
            ],
          ),
        ),
      ),
    );
  }
}
