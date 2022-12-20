

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Models/EstateModel.dart';
import 'package:kbs_real_estate_trading/screen/ForSale.dart';

class UpLoadController extends GetxController{
    EstateModel _estateModel = Get.find();

  var _contacts = FirebaseFirestore.instance.collection("collection")
  .withConverter<EstateModel>(fromFirestore: ((snapshot, _) =>EstateModel.fromMap(snapshot.data()!) )
  , toFirestore: ((estate, _) =>estate.toMap()));

    Rx<UpLoadState> uploadState = UpLoadState().obs;

    void uploadEstateData (String length,String width,String price,String description){
      uploadState.value = UploadLoading();
          _contacts.add(
            EstateModel(
              length:length,
              width: width,
              price: price,
              description: description 
            )
          ).then((estateModel){
            uploadState.value = UploadSuccess(estateModel);
            Get.off(()=>ForSale());
          }).catchError((e){
              uploadState.value = UploadFail();
          }).whenComplete((){
           length = "";
           width = "";
           price = "";
           description = "";

          
          });
    }

}
class UpLoadState {}
class UploadLoading extends UpLoadState{}
class UploadSuccess extends UpLoadState{
 final DocumentReference<EstateModel> estateModel;

  UploadSuccess(this.estateModel);

}
class UploadFail extends UpLoadState{}