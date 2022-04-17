import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tp_rest_api/widgets/drawer_item.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
      decoration: BoxDecoration(
      color: Colors.black12
      ),
              child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/med.jpg"),
                radius: 50,
              ),
              SizedBox(height: 7,),
              Text("Mohamed Ait Lahcen",style:TextStyle(fontSize: 17,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
            ],
          )),
          Padding(padding: EdgeInsets.all(7),child: Column(children: [
            DrawerItem("Home","/",Icon(Icons.home)),
            SizedBox(height: 3),
            DrawerItem("Contacts","/contacts",Icon(Icons.contacts)),
            SizedBox(height: 3),
            DrawerItem("Github Users","/github_users",Icon(Icons.supervised_user_circle)),
            SizedBox(height: 3),
            DrawerItem("News","/news",Icon(Icons.newspaper)),
            SizedBox(height: 3),
            DrawerItem("Covid 19","/covidNews",Icon(Icons.airplay_rounded)),
            SizedBox(height: 3),
            DrawerItem("About","/about",Icon(Icons.error)),

          ],),)

        ],
      ),
    );
  }
}
