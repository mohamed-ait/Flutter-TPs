import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_rest_api/providers/list_contacts_state.dart';



class Contacts extends StatefulWidget {
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  TextEditingController textController = new TextEditingController();
  var borderRadius = const BorderRadius.all(Radius.circular(7));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 60,),
            Icon(Icons.contacts,size: 30),
            SizedBox(width: 10,),
            Text("Conacts",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.contacts),
                        hintText: "Entrez un nom",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),
                    controller: textController,
                  ),
                ),
                SizedBox(width: 3),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.blueGrey,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(color:Colors.white70,onPressed: () {
                    setState(() {
                      Provider.of<ListValueState>(context,listen: false).addItem(textController.text);
                      textController.clear();
                    });
                  }, icon: Icon(Icons.add))
                ),
              ],
            ),
            Expanded(
              child: Consumer<ListValueState>(
                builder: (context,listValuesSate,chid){
                  print("***** Consumer *****");
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listValuesSate.data.length,
                    itemBuilder: ((context, index) {
                      //SizedBox(height: 5);
                      return Card(child : ListTile(
                          //shape: RoundedRectangleBorder(borderRadius: borderRadius),
                      leading: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      child: Text(Provider.of<ListValueState>(context,listen: false).data[index].substring(0,1)),
                      ),
                      title:  Text(Provider.of<ListValueState>(context,listen: false).data[index]),
                      trailing: ElevatedButton(
                      onPressed: () {
                      setState(() {
                      Provider.of<ListValueState>(context,listen: false).data.removeAt(index);
                      });
                      },
                      child: Icon(Icons.delete, color: Colors.black),
                      style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.black38, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                      ),
                      ))
                      ); // Lis

                    }),
                  );
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
