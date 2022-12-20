
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Models/EstateModel.dart';
import 'package:kbs_real_estate_trading/screen/addDataForm.dart';
import 'package:kbs_real_estate_trading/screen/bottomNav.dart';
import 'package:kbs_real_estate_trading/screen/ForSale.dart';
import 'package:kbs_real_estate_trading/screen/imageView.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  EstateModel estateModel = Get.put(EstateModel());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home:BottomNav()
        
        ),

    
  );
  
}
