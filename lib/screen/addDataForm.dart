import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Controller/addController.dart';

import 'ForSale.dart';

class AddDataForm extends StatefulWidget {
  const AddDataForm({Key? key}) : super(key: key);

  @override
  State<AddDataForm> createState() => _AddDataFormState();
}

class _AddDataFormState extends State<AddDataForm> {
  String? _length,_width, _price, _description;
  GlobalKey<FormState> _key = GlobalKey();
  UpLoadController _upLoadController = UpLoadController();
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Add Data")),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 15, vertical: size.height / 40),
        child: Column(children: [
          Form(
            key: _key,
              child: Column(
            children: [
              TextFormField(
                
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return "enter length";
                  }
                }),
                onSaved: ( value) {
                  _length = value ;
                },
                decoration: InputDecoration(
                    hintText: "length",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              TextFormField(
                 validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return "enter width";
                  }
                }),
                onSaved: (value) {
                  _width = value;
                },
                decoration: InputDecoration(
                    hintText: "width",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              TextFormField(
                 validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return "enter price";
                  }
                }),
                onSaved: (value) {
                  _price = value;
                },
                decoration: InputDecoration(
                    hintText: "Price",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              TextFormField(
                 validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return "enter description";
                  }
                }),
                onSaved: (value) {
                  _description = value;
                },
                decoration: InputDecoration(
                    hintText: "Description",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  if(_key.currentState!.validate() && _key.currentState != null){
                    _key.currentState!.save();
                     _upLoadController.uploadEstateData(
                          _length ?? "", 
                          _width ?? "", 
                          _price ?? "", 
                          _description ?? "");
                    
                  }
                  
                },
                child: Text(
                  "Confirm",
                ),
              ),
                Obx(()
                  {
                    UpLoadState uploadState = _upLoadController.uploadState.value;
                    if(uploadState is UploadLoading){
                        return Center(child: CircularProgressIndicator());
                    }
                    if(uploadState is UploadSuccess ){
                 
                    return Text("success");
                    }
                    if(uploadState is UploadFail){
                          return Text("Something was Wrong");
                    }
                    return SizedBox();
                  },)
            ],
          ))
        ]),
      ),
    );
  }
}
