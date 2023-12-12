

import 'dart:convert';

import 'package:api_class_4/Model/imagemodel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


                  //image Repo

Future<List<Imagemodel>>  getImageRepo() async {
  List<Imagemodel> getallImage=[];
  final String uri="https://jsonplaceholder.typicode.com/photos";
  var response=await http.get(Uri.parse(uri));

  print(response.body);
  print(response.statusCode);
  var data=jsonDecode(response.body);
  if(response.statusCode==200){
    for(var list in data){
      getallImage.add(Imagemodel.fromJson(list));
    }
    EasyLoading.showSuccess("Success");
  }else{
    EasyLoading.showError("Error");
  }

  return getallImage;
}