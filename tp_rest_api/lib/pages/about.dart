import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Row(
    children: [
      SizedBox(width: 60,),
      Icon(Icons.account_box_outlined,size: 30),
      SizedBox(width: 10,),
      Text("About",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
    ],
  )

),
      backgroundColor: Colors.black12,
      body: Padding(
        padding: EdgeInsets.fromLTRB(35, 40, 35, 0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green[700],
                maxRadius: 60,
                backgroundImage: AssetImage("images/med.jpg"),
              ),
              SizedBox(height: 10,),
              Text("Mohamed ait lahcen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              SizedBox(height: 25,),
              Card(
                margin:
                EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
                elevation: 7,
                child:Padding(
                  padding: EdgeInsets.all(8),
                  child:  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.call),
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 10,),
                      Text("0628020585")
                    ],
                  ),
                )
              ),
              Card(
                  margin:
                  EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
                  elevation: 7,
                  child:Padding(
                    padding: EdgeInsets.all(8),
                    child:  Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.email),
                          backgroundColor: Colors.black87,
                        ),
                        SizedBox(width: 10,),
                        Text("Mohamedaitlahcen62@gmail.com")
                      ],
                    ),
                  )
              ),
              Card(
                  margin:
                  EdgeInsets.symmetric(vertical: 7.0, horizontal: 25.0),
                  elevation: 7,
                  child:Padding(
                    padding: EdgeInsets.all(8),
                    child:  Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.location_city),
                          backgroundColor: Colors.brown[400],
                        ),
                        SizedBox(width: 10,),
                        Text("Kelaa m'gouna")
                      ],
                    ),
                  )
              ),


            ],
          ),
        ),
      ));
  }

}