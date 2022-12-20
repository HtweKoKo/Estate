import 'package:cloud_firestore/cloud_firestore.dart';

class EstateModel{
  String? id;
 String?length,width;
  String? price;
 String? description;
 bool? favourite;
 EstateModel({this.length,this.width,this.price,this.description,this.favourite,this.id});
 factory EstateModel.fromMap(Map map){
  return EstateModel(
      length: map["length"],
      width: map["width"],
      price: map["price"],
      description: map["description"],
      favourite: map["favourite"],
  );
 }
 Map<String,dynamic> toMap(){
  return {
      "length" : length,
      "width": width,
      "price":price,
      "description":description,
      "favourite":favourite,
    
  };
 }
  static EstateModel fromSnapShot(DocumentSnapshot snapshot){
      return EstateModel(
        id: snapshot.id,
        length: snapshot["length"] ,
        width:snapshot["width"] ,
        price:snapshot["price"], 
        description: snapshot["description"],
        favourite: snapshot["favourite"],
      ); 

  }
 
}