import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_bloc/bloc/bloc/contact_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc/bloc/bloc/contact_event.dart';
import 'package:tp_bloc/bloc/bloc/contact_state.dart';

class ButtonContact extends StatelessWidget {
  final String text;
  final ContactEvent event;
  const ButtonContact({Key? key,required this.text,required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      context.read<ContactBloc>().add(this.event);
      print(this.event.runtimeType.toString());
    }, child: Text(this.text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),style: ElevatedButton.styleFrom(
        primary: (context.read<ContactBloc>().lastEvent.runtimeType.toString().compareTo(event.runtimeType.toString())==0 ? Colors.amberAccent : Colors.black45)
    ));
  }
}
