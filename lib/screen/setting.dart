import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/screen/FbPage.dart';
import 'package:kbs_real_estate_trading/widgets.dart';

import '../Constants/constant.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 209, 207, 207),
     
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            listTile("Favourite"),
            listTile("Light theme"),
            listTile("Saled estate"),
            InkWell(
              onTap:(){
                 Get.to(()=> FbPage());
              },             
               child: listTile("Facebook page")),
            Padding(
              padding: EdgeInsets.only(top: size.height/3),
              child: Text("Developed by Recoding",
              style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 163, 161, 161)),
              ),
            )
              
            ],),
      ),
    );
  }
  Widget listTile(text){
    return Card(
      child: ListTile(
        leading: Text(text),
      ),
    );
  }
  
}