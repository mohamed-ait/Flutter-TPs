import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc/bloc/bloc/contact_bloc.dart';
import 'package:tp_bloc/bloc/bloc/contact_event.dart';
import 'package:tp_bloc/bloc/bloc/contact_state.dart';
import 'package:tp_bloc/bloc/repositories/ContactRepository.dart';
import 'package:tp_bloc/bloc/ui/widgets/button_bar.dart';
import 'package:tp_bloc/bloc/ui/widgets/contacts_list.dart';
import 'package:tp_bloc/bloc/ui/widgets/reload_button.dart';

class ContactPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          SizedBox(width: 85,),
          Icon(Icons.contacts),
          SizedBox(width: 10,),
          Text("contacts")
        ],
      ),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            BlocBuilder<ContactBloc,ContactState>(builder: (context, state) {
              // la classe qui retourne les buttons :
             return  ButtonsBar();
            }),
         SizedBox(height: 30,),
         BlocBuilder<ContactBloc,ContactState>(
    builder: (context,state){
        if(state.requestSate==RequestState.Loading){
          return CircularProgressIndicator();
    }else if(state.requestSate==RequestState.Loaded){
          return Expanded(
            child: ListContact(state: state,)
          );
    }
        else if(state.requestSate==RequestState.Error){
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage,style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize:16,fontStyle: FontStyle.italic),),
                SizedBox(height: 10,),
                ReloadButton()
                  ],
            ),
          );
        }
    return Center(child:Column(children: [
      Text("aucun elements !",style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
    ],));
    },
    )

    ]),
      ));
  }

}