import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
class ArticlesApp extends StatefulWidget{
  @override
  State<ArticlesApp> createState() => _ArticlesAppState();
}

class _ArticlesAppState extends State<ArticlesApp> {
  var news=null;
  BorderRadius bd=BorderRadius.all(Radius.circular(10));
  TextEditingController articleController=new TextEditingController();
  String keyApi="78ab7c682a2141aaa6e6791aa13d6ba1";
  void getArticles(String key){
    String url="https://newsapi.org/v2/everything?q=${key}&from=2022-04-02&sortBy=publishedAt&apiKey=${keyApi}";
     http.get(Uri.parse(url)).then((res) {
       setState(() {
         news=json.decode(res.body);
       });
     }).catchError((onError){
       print(onError);
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 60,),
            Icon(Icons.newspaper,size: 30),
            SizedBox(width: 10,),
            Text("News articles",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
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
                  controller: articleController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.newspaper),
                      hintText: "Entrez un motClé",
                    border: OutlineInputBorder(
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
                      getArticles(articleController.text);
                    });
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Expanded(child: ListView.builder(padding: EdgeInsets.all(10),itemCount: news==null || news["articles"]==null ? 0 : news["articles"].length
                ,itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  focusColor: Colors.white70,
                 // shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black26),borderRadius: bd),
                  title: Column(
                    children: [
                      Row(children: [
                        Expanded(child: Image.network(news["articles"][index]["urlToImage"]))
                      ],),
                      SizedBox(height: 5,),
                      Text(news["articles"][index]["title"],style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),textAlign: TextAlign.center),
                      SizedBox(height: 7,),
                      Text(news["articles"][index]["description"]),
                      SizedBox(height: 5,),
                      Text(news["articles"][index]["author"],style:TextStyle(fontSize: 12)),
                    ],
                  ),

                ),
              );

                }))
          ],
        ),

      )

    );
  }
}