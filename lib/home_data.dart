import 'package:api_class_4/Repo/dataRepo.dart';
import 'package:flutter/material.dart';
class HomeData extends StatefulWidget {
  const HomeData({super.key});

  @override
  State<HomeData> createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future:  getDataRepo(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      isThreeLine: true,

                    ),
                  );
                },

              );
            }else{
              return CircularProgressIndicator();
            }
          },),
    );
  }
}
