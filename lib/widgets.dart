
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/screen/details.dart';
import 'package:kbs_real_estate_trading/screen/googlemap.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constants/constant.dart';
import 'Models/EstateModel.dart';
  var detailsData = FirebaseFirestore.instance.collection("collection");

Widget realEtateTradingCard({required Size size,required String price,required String id,required EstateModel estateModel}) {
    return Card(
      child: Container(
        width: size.width,
        height: size.height - ((size.height / 4) * 3),
        decoration: BoxDecoration(),
        child: Stack(children: [
          Image.asset(
            "asset/images/field.jpg",
            fit: BoxFit.fill,
            width: size.width,
          ),
          IconButton(
            onPressed:(){
             detailsData.doc(id).delete();
            } ,
           icon: Icon(Icons.delete)),
          Positioned(
            right: 0,
            child: Container(
              width: size.width / 1.9,
              height: size.height / 26,
              decoration: BoxDecoration(
                  color: Constants.PRIMARYCOLORS,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(300))),
                      child:Center(child: Text(price,
                      style: TextStyle(color: Colors.white,fontSize: 16),
                      )) ,
                      
            ),
           
          ),
          
          Positioned(
              bottom: size.height / 100,
              right: size.width / 60,
              child: InkWell(
                onTap: (){
                Get.to(()=> Details( details:estateModel));
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                      width: size.width / 3.5,
                      height: size.height / 20,
                      decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     color: Constants.PRIMARYCOLORS),
                      child: Center(
                     child: Text(
                   "More details>>>",
                   style: TextStyle(color: Color.fromARGB(255, 255, 253, 253)),
                      )),
                    ),
                ),
              ))
        ]),
      ),
    );
  }
  Widget moreDetails(Size size,length,width,price,description){
    return  Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height:  (size.height / 7) * 4,
                decoration: BoxDecoration(
                  color: Constants.SECONDARY,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "အသေးစိတ်အချက်အလက်",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              
                            ],
                          ),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          Text(
                            "အလျား x အနံ : $length x $width",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          Text(
                            "Price : $price ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          ReadMoreText(description,
                              numLines: 6,
                              readMoreText: "read More",
                              readLessText: "read less"),
                          SizedBox(
                            height: size.height / 40,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: ()async{
                                      final uri = Uri.parse("tel:+959452018029");
                                      if(await canLaunchUrl(uri)){
                                        await launchUrl(uri);
                                      }
                                      else{
                                        throw "something Wrong";
                                      }
                                                                        },
                                  child: Container(
                                    width: size.width / 1.7,
                                    height: size.height / 18,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(8)),
                                        color: Constants.PRIMARYCOLORS),
                                    child: Center(
                                        child: Text(
                                      "ဖုန်းခေါ်မည်",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 20,
                                ),
                                InkWell(
                                  onTap: ()async{
                                    Get.to(()=> EstateGoogle());
                                  },
                                  child: Container(
                                    width: size.width / 4,
                                    height: size.height / 18,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(8)),
                                        color: Constants.PRIMARYCOLORS),
                                    child: Center(
                                        child: Icon(
                                      Icons.map,
                                      color: Colors.white,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
              ),
             );
  }
  Widget appBar(Size size){
    return  Container(
            width: size.width / 1.1,
            height: size.height / 12,
            child: Image.asset(
              "asset/images/kbsLogo.png",
              fit: BoxFit.fill,
            ),
          );
        
  }
