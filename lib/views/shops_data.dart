import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_api_app/components/appbar.dart';
import 'package:hello_api_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:hello_api_app/models/shops_data_model.dart';

class ShopsDataPage extends StatefulWidget {
  @override
  State<ShopsDataPage> createState() => _ShopsDataPageState();
}

class _ShopsDataPageState extends State<ShopsDataPage> {
  @override
  Future<ShopsDataModel> getShopsDataAPI() async {
    final response = await http.get(Uri.parse(kShopsDataURL));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ShopsDataModel.fromJson(data);
    } else {
      return ShopsDataModel.fromJson(data);
    }
  }

  Widget build(BuildContext context) {
    HeightWidth(context);
    return Scaffold(
      appBar: appBar("All Shops API Page"),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: FutureBuilder(
          future: getShopsDataAPI(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading Data...");
            } else {
// 1st ListView (data_i)
              return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: ((context, data_i) {
                  final data = snapshot.data!.data![data_i];

                  return Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      boxShadow: [kShadow],
                      color: kBlue1,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              data.sId.toString(),
                              style: kTextbold,
                            ),
                            Text(
                              data.name.toString(),
                              style: kTextbold,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(data.description.toString()),
                            Text(data.shopemail.toString()),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.25,
                          width: w * 1,
                          child: ListView.builder(
// 2nd ListView (products_i)
                            physics: BouncingScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: ((context, products_i) {
                              final products = snapshot
                                  .data!.data![data_i].products![products_i];

                              return Container(
                                padding: EdgeInsets.all(8.0),
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(color: kBlue2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(products.title.toString()),
                                        Text(
                                            "sold:" + products.sold.toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Price: " + products.price.toString()),
                                        Text("Sale Price: " + products.salePrice.toString()),
                                        // Text(products.description.toString()),
                                      ],
                                    ),
                                    
                                    Center(
                                      child: SizedBox(
                                        height: h * 0.15,
                                        width: w * 1,
                                        child: ListView.builder(
// 3rd ListView (images_i)
                                          scrollDirection: Axis.horizontal,
                                          physics: BouncingScrollPhysics(),
                                          itemCount: 3,
                                          itemBuilder: ((context, images_i) {
                                            final images = snapshot.data!.data![data_i]
                                                .products![products_i]
                                                .images![images_i];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: CircleAvatar(
                                                radius: 40.0,
                                                backgroundImage: NetworkImage(
                                                 images.url! ,
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                    Text(products.description.toString()),
                                  ],
                                ),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              );
            }
          }),
        )),
      ]),
    );
  }
}
