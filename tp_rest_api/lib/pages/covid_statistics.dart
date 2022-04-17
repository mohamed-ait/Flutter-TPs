import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:tp_rest_api/widgets/CovidCard.dart';

class CovidApp extends StatefulWidget{
  @override
  State<CovidApp> createState() => _covidAppState();
}
class _covidAppState extends State<CovidApp> {
  var data=null;
  TextEditingController covidController=new TextEditingController();
  //get statistiques :
  void getData(String country){
    String url="https://covid-api.mmediagroup.fr/v1/cases?country=${country}";
    http.get(Uri.parse(url)).then((res) {
      setState(() {
        data=json.decode(res.body);
      });
    }).catchError((onError){
      print(onError);
    });
  }
  //get flag of country :
  String getFlag(String country){
     String url="https://countryflagsapi.com/png/${country}";
     return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(width: 20,),
              Icon(Icons.airplay_rounded,size: 30),
              SizedBox(width: 10,),
              Text("Covid-19 statistics",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: TextFormField(
                    controller: covidController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.airplay_rounded),
                        hintText: "Entrez un pays",
                        border: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),
                  )),
                  SizedBox(width: 3,),
                  Ink(
                    decoration: ShapeDecoration(
                        color: Colors.blueGrey,
                        shape: CircleBorder()
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (){
                        setState(() {
                          getData(covidController.text);
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Expanded(child: ListView.builder(padding: EdgeInsets.all(10),itemCount:data==null || data["All"]==null ? 0 : 1
                  ,itemBuilder: (context,index){
                    return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      shadowColor: Colors.black87,
                     color: Colors.black12,
                     elevation: 15,
                     child: Padding(
                       padding: EdgeInsets.fromLTRB(0, 10, 2, 10),
                       child: ListTile(
                       focusColor: Colors.white70,
                       // shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26),borderRadius: bd),
                       title: Column(
                         children: [
                           Row(children: [
                             Expanded(child: Image.network(getFlag(covidController.text)),)
                           ],),
                           SizedBox(height: 3,),
                          Padding(padding: EdgeInsets.fromLTRB(2,10,2,10),
                          child:  Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                            Text("deaths :\t"),
                            SizedBox(width: 20,),
                            Text(data["All"]["deaths"].toString(),style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),textAlign: TextAlign.center),
                          ],),),
                           SizedBox(height: 3,),
                          Padding(padding: EdgeInsets.fromLTRB(2,10,2,10),
                          child:  Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                            Text("confirmed :\t "),
                            SizedBox(width: 20,),
                            Text(data["All"]["confirmed"].toString(),style:TextStyle(fontWeight: FontWeight.bold)),
                          ],),),
                           SizedBox(height: 3,),
                           Padding(padding: EdgeInsets.fromLTRB(2,10,2,10),
                           child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                             Text("updated :\t "),
                             SizedBox(width: 3,),
                             Text(data["All"]["updated"].toString().substring(0,10),style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),textAlign: TextAlign.center),
                           ],),
                           ),
                           Padding(padding: EdgeInsets.fromLTRB(2,10,2,10),
                             child:  Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                               Text("population :\t"),
                               SizedBox(width: 20,),
                               Text(data["All"]["population"].toString(),style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),textAlign: TextAlign.center),
                             ],),),
                         ],

                       ),
                      ),
                    ));

                  }))
            ],
          ),

        )

    );
  }
}