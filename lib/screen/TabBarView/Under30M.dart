import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Controller/ReadEstateDataController.dart';
import 'package:kbs_real_estate_trading/widgets.dart';

import '../../Controller/under30MController.dart';
import '../../Models/EstateModel.dart';

class Under30M extends StatefulWidget {
  const Under30M({Key? key}) : super(key: key);

  @override
  State<Under30M> createState() => _Under30MState();
}

class _Under30MState extends State<Under30M> {
  var _under30MController = Under30MController();
  var _readEstateDataController = ReadEstateDataController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //  return Obx((() {
    //   return ListView.builder(
    //     itemCount: _under30MController.estateModel.length,
    //     itemBuilder: (context,index){
    //         var price = _under30MController.estateModel[index].price;
    //         var id = _under30MController.estateModel[index].id;
    //         var estate = _under30MController.estateModel[index];
    //         return realEtateTradingCard(size: size, price: price ?? "", id: id ?? "", estateModel: estate);
    //     });
    // }));
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
  }
}