import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GitHubUsers extends StatefulWidget {
  @override
  State<GitHubUsers> createState() => _GitHubUsersState();
}

class _GitHubUsersState extends State<GitHubUsers> {
  var users=null;
  TextEditingController textEditingController=new TextEditingController();

  void searchGithubUser(userKey){
    String url="https://api.github.com/search/users?q=${userKey}&per_page=10&page=0";
    http.get(Uri.parse(url))
        .then((response) {
      setState(() {
        users= json.decode(response.body);
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
            Icon(Icons.supervised_user_circle_sharp,size: 30),
            SizedBox(width: 10,),
            Text("Github users",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
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
                  controller: textEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                )),
                SizedBox(width: 3),
                Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.blueGrey,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          searchGithubUser(textEditingController.text);
                          textEditingController.clear();
                        });
                      },
                      icon: Icon(Icons.search),
                    )
                ),

              ],
            ),
            Expanded(
              child: ListView.builder(

                itemCount:users==null||users["items"]==null?0: users["items"].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(users["items"][index]["avatar_url"]),
                    ),
                    title: Text(users["items"][index]["login"]),
                  );
                },),
            )
          ],
        ),
      ),
    );
  }
}
