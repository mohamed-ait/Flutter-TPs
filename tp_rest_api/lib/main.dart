import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_rest_api/pages/about.dart';
import 'package:tp_rest_api/pages/contacts.dart';
import 'package:tp_rest_api/pages/covid_statistics.dart';
import 'package:tp_rest_api/pages/github_users.dart';
import 'package:tp_rest_api/pages/home.dart';
import 'package:tp_rest_api/pages/news_articles.dart';
import 'package:tp_rest_api/providers/list_contacts_state.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ListValueState())],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey
        ),
        routes: {
          "/":(context)=>Home(),
          "/contacts":(context)=>Contacts(),
          "/github_users":(context)=>GitHubUsers(),
          "/news":(context)=>ArticlesApp(),
          "/covidNews":(context)=>CovidApp(),
          "/about":(context)=>About(),
        },

      ),
    );
  }

}




