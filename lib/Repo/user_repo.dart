
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../Model/datamodel.dart';
import '../Model/usermodel.dart';
// user repo

Future<List<Usermodel>>  getUserRepo() async {
  List<Usermodel> getallUsers=[];
  final String uri="https://jsonplaceholder.typicode.com/users";
  var response=await http.get(Uri.parse(uri));

  print(response.body);
  print(response.statusCode);
  var data=jsonDecode(response.body);
  if(response.statusCode==200){
    for(var list in data){
      getallUsers.add(Usermodel.fromJson(list));
    }
    EasyLoading.showSuccess("Success");
  }else{
    EasyLoading.showError("Error");
  }

  return getallUsers;
}