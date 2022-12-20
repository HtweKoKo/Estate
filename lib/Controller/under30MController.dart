
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Models/EstateModel.dart';

class Under30MController extends GetxController{
  var _contacts = FirebaseFirestore.instance;
  var estateModel = <EstateModel>[].obs;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    estateModel.bindStream(getUnder30M());
  }

Stream<List<EstateModel>> getUnder30M(){
    return _contacts.collection("collection")
    
    .snapshots().map((snapshot) =>snapshot.docs.map((estatedata) => 
    EstateModel.fromSnapShot(estatedata)
    ).toList() );
}


}