import 'package:flutter/material.dart';

import 'Repo/image_repo.dart';
class HomeImage extends StatefulWidget {
  const HomeImage({super.key});

  @override
  State<HomeImage> createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future:  getImageRepo(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return   ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${snapshot.data?[index].url}"),
                  ),
                  trailing: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("${snapshot.data?[index].thumbnailUrl}"),
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
