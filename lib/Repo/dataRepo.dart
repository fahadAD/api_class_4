import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../Model/datamodel.dart';
                // data repo

Future<List<Datamodel>>  getDataRepo() async {
 List<Datamodel> getallData=[];
 final String uri="https://jsonplaceholder.typicode.com/posts";
 var response=await http.get(Uri.parse(uri));

print(response.body);
print(response.statusCode);
 var data=jsonDecode(response.body);
if(response.statusCode==200){
  for(var list in data){
    getallData.add(Datamodel.fromJson(list));
  }
  EasyLoading.showSuccess("Success");
}else{
  EasyLoading.showError("Error");
}

return getallData;
}