
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DrawerItem extends StatelessWidget{
  String route;
  String title;
  //BorderRadius bd=BorderRadius.all(Radius.circular(10));
  Icon icon;
  DrawerItem(this.title,this.route,this.icon);
  @override
  Widget build(BuildContext context) {
    return Card(child:
        ListTile(
          focusColor: Colors.white70,
          //shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12),borderRadius: bd),
          onTap: (){
            Navigator.pushNamed(context, route);
          },
          leading: icon,
          title: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        )
    );
  }

}