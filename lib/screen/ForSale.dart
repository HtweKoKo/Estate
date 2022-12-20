import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Constants/constant.dart';
import 'package:kbs_real_estate_trading/Controller/ReadEstateDataController.dart';
import 'package:kbs_real_estate_trading/Models/EstateModel.dart';
import 'package:kbs_real_estate_trading/screen/addDataForm.dart';
import 'package:kbs_real_estate_trading/screen/bottomNav.dart';
import 'package:kbs_real_estate_trading/widgets.dart';

class ForSale extends StatefulWidget {
  const ForSale({Key? key}) : super(key: key);

  @override
  State<ForSale> createState() => _HomeState();
}

class _HomeState extends State<ForSale> {
  ReadEstateDataController _readEstateDataController =
      Get.put(ReadEstateDataController());
  // var contactsData = FirebaseFirestore.instance.collection("collection")
  // .withConverter<EstateModel>(fromFirestore:((snapshot, _) => EstateModel.fromMap(snapshot.data()!)), toFirestore: ((estate, _) =>estate.toMap() ))
  // .snapshots();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
    
     Obx(() {
      return ListView.builder(
          itemCount: _readEstateDataController.estateModel.length,
          itemBuilder: ((context, index) {
            var id = _readEstateDataController.estateModel[index].id;
            var price = _readEstateDataController.estateModel[index].price;
            EstateModel estateModel =
                _readEstateDataController.estateModel[index];

            return realEtateTradingCard(
                size: size,
                price: price ?? "",
                id: id ?? "",
                estateModel: estateModel);
          }));
    });

    // body:StreamBuilder<QuerySnapshot<EstateModel>>(
    //   stream: contactsData,
    //   builder: ((context, snapshot){
    //       if(snapshot.hasData){
    //         var data = snapshot.data!.docs;
    //         return ListView.builder(
    //           itemCount: data.length ,
    //           itemBuilder: ((context, index) {
    //               var aa= data[index];
    //             return Text(aa.data().length ?? "");
    //           })
    //         );
    //       }
    //     return CircularProgressIndicator();
    //   } )) ,
    //     body: Obx(() {
    //       return ListView.builder(
    //           itemCount: _readEstateDataController.estateModel.length,
    //           itemBuilder: ((context, index) {
    //             var price = _readEstateDataController.estateModel[index].price;
    //             EstateModel data  = _readEstateDataController.estateModel[index];

    //             return realEtateTradingCard(size, price,data);
    //           }));
    //     }),

    //   ),
    // );
  }
}
