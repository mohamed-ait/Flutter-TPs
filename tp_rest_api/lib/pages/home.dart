import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
//import 'package:tp1_flutter/widgets/app_drawer.dart';
import 'package:tp_rest_api/widgets/app_drawer.dart';

class Home extends StatelessWidget{
  BorderRadius br=BorderRadius.circular(15);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(width: 60,),
              Icon(Icons.home,size: 30),
              SizedBox(width: 10,),
              Text("Home",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
            ],
          )
        ),
        body: new Stack(
    children: [
      new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(image: NetworkImage("https://i.stack.imgur.com/N80YNl.png"), fit: BoxFit.cover,),
        ),
      ),
        Padding(
        padding: EdgeInsets.all(30),
      child: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: [
          Card(
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26),borderRadius: br,
            ),
            child:  new InkWell(onTap:()=>{
              Navigator.pushNamed(context, "/contacts")
            }
              ,child:Padding(
                padding: EdgeInsets.all(15),
                child: ListTile(
                  focusColor: Colors.white70,
                  title:Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green[700],
                        maxRadius: 30,
                        child: Icon(Icons.contacts,size: 35),
                      ),
                      SizedBox(height: 15,),
                      Text("Contacts",style: TextStyle(color: Colors.green[700],fontWeight: FontWeight.bold),)
                    ],
                  ),
                  minVerticalPadding: 15,


                ),
              ),),
            color: Colors.amberAccent[40],
            elevation: 5,
          ), Card(
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26),borderRadius: br,
            ),
            child: new InkWell(onTap:()=>{
              Navigator.pushNamed(context, "/news")
            }
                ,child:  Padding(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    focusColor: Colors.white70,
                    title:Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue[700],
                          maxRadius: 30,
                          child: Icon(Icons.newspaper,size: 35),
                        ),
                        SizedBox(height: 15,),
                        Text("News",style: TextStyle(color: Colors.blue[700],fontWeight: FontWeight.bold),)
                      ],
                    ),
                    minVerticalPadding: 15,


                  ),
                )),
            color: Colors.amberAccent[40],
            elevation: 5,
          ), Card(
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26),borderRadius: br,
            ),
            child:  new InkWell(onTap:()=>{
              Navigator.pushNamed(context, "/github_users")
            }
                ,child:Padding(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    focusColor: Colors.white70,
                    title:Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.cyan[700],
                          maxRadius: 30,
                          child: Icon(Icons.contacts,size: 35),
                        ),
                        SizedBox(height: 15,),
                        Text("Github ",style: TextStyle(color: Colors.cyan[700],fontWeight: FontWeight.bold),)
                      ],
                    ),
                    minVerticalPadding: 15,


                  ),
                )),
            color: Colors.amberAccent[40],
            elevation: 5,
          ),
          Card(
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26),borderRadius: br,
            ),
            child:  new InkWell(onTap:()=>{
              Navigator.pushNamed(context, "/covidNews")
            }
                ,child:Padding(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    focusColor: Colors.white70,
                    title:Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red[700],
                          maxRadius: 30,
                          child: Icon(Icons.contacts,size: 35),
                        ),
                        SizedBox(height: 15,),
                        Text("Covid19",style: TextStyle(color: Colors.red[700],fontWeight: FontWeight.bold),)
                      ],
                    ),
                    minVerticalPadding: 15,


                  ),
                )),
            color: Colors.amberAccent[40],
            elevation: 5,
          ),
          Card(
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26),borderRadius: br,
            ),
            child:  new InkWell(onTap:()=>{
              Navigator.pushNamed(context, "/about")
            }
                ,child:Padding(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                    focusColor: Colors.white70,
                    title:Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orange[700],
                          maxRadius: 30,
                          child: Icon(Icons.account_box_outlined,size: 35),
                        ),
                        SizedBox(height: 15,),
                        Text("About",style: TextStyle(color: Colors.orange[700],fontWeight: FontWeight.bold),)
                      ],
                    ),
                    minVerticalPadding: 15,


                  ),
                )),
            color: Colors.amberAccent[40],
            elevation: 5,
          ),
        ],

      ),
    )])

    );
  }

}