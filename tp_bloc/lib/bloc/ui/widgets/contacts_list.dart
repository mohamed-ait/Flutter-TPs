import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_bloc/bloc/bloc/contact_state.dart';

class ListContact extends StatelessWidget {
  final ContactState state;
  const ListContact({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: state.contacts.length,
      itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.lightGreen,child: Text("${state.contacts[index].profile}"),),
            title: Text(state.contacts[index].name),

          ),
        );

      },
    );
  }
}
