import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kbs_real_estate_trading/Constants/constant.dart';
import 'package:kbs_real_estate_trading/widgets.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class FbPage extends StatelessWidget {
  const FbPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var  size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        toolbarHeight: 70,
        backgroundColor: Constants.PRIMARYCOLORS,
          automaticallyImplyLeading: false,
          title: appBar(size),
       
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
          children: [
            Text("Scan Here",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
            ),
            Image.asset("asset/images/QRCode.png",
            width: size.width/2,
            height: size.height/3.8,
            fit: BoxFit.cover,
            ),
           Text("OR"),
           SizedBox(height: size.height/20,),
          ElevatedButton(onPressed: ()async{
              final link = Uri.parse("https://www.facebook.com/profile.php?id=100087749027528&mibextid=ZbWKwL");
              if( await canLaunchUrl(link)){
                await launchUrl(link);
              }else{
                throw "CHECK VPN";
              }
          },
           child: Text("Go to FaceBook"))

          ]),
      ),
    );
  }
  
  
}