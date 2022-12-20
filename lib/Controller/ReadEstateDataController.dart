import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/EstateModel.dart';

class ReadEstateDataController extends GetxController {
  var _contacts = FirebaseFirestore.instance;
  var estateModel = <EstateModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    estateModel.bindStream(readEstateData());
    
  }

  Stream<List<EstateModel>> readEstateData() {
     
    var aa = _contacts.collection("collection").
    snapshots().map((snapshot) {
      return snapshot.docs.map((estate) {
     
      
        return EstateModel.fromSnapShot(estate);
      }).toList();
    });
    return aa;
  }
  
  
}



