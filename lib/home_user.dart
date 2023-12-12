import 'package:flutter/material.dart';

import 'Repo/user_repo.dart';
class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future:  getUserRepo(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return   ListTile(
                  isThreeLine: true,
                  leading:  Text("${snapshot.data?[index].username}"),
                  title: Text("Street: ${snapshot.data?[index].address?.street}"),
                  subtitle: Text("Lat: ${snapshot.data?[index].address?.geo?.lat}"),
                  trailing: Text("Name: ${snapshot.data?[index].company?.name}"),
                );
              },

            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },),
    );
  }
}