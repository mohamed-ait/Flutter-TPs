import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CovidCard extends StatelessWidget{
  String country,lastUpdatedApify,deceased,infected;
  CovidCard(this.country,this.infected,this.deceased,this.lastUpdatedApify);
  @override
  Widget build(BuildContext context) {
   return Card(
     child: Padding(
       padding: EdgeInsets.all(15),
       child: Column(
         children: [
           Row(
             children: [
               Text("country",style: TextStyle(fontSize: 16),),
               SizedBox(width: 30,),
               Text(country,style: TextStyle(fontSize: 16),),
             ],
           ),
           SizedBox(height: 8,),
           Row(
             children: [
               Text("infected",style: TextStyle(fontSize: 16),),
               SizedBox(width: 30,),
               Text(infected,style: TextStyle(fontSize: 16),),
             ],
           ),
           SizedBox(height: 8,),
           Row(
             children: [
               Text("deceased",style: TextStyle(fontSize: 16),),
               SizedBox(width: 30,),
               Text(deceased,style: TextStyle(fontSize: 16),),
             ],
           ),
           SizedBox(height: 8,),
           Row(
             children: [
               Text("lastUpdatedApify",style: TextStyle(fontSize: 16),),
               SizedBox(width: 30,),
               Text(lastUpdatedApify,style: TextStyle(fontSize: 16),),
             ],
           ),
           SizedBox(height: 8,),

         ],
       ),
     ),
   );
  }

}