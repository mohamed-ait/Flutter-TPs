import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc/bloc/bloc/contact_bloc.dart';

class ReloadButton extends StatelessWidget {
  const ReloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      ContactBloc cb=context.read<ContactBloc>();
      cb.add(cb.lastEvent);
    }, child: Icon(Icons.wifi_protected_setup_outlined),
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(3),
        fixedSize: const Size(45, 45),
        shape: const CircleBorder(),
      ),)
    ;
  }
}
