import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp_bloc/bloc/bloc/contact_bloc.dart';
import 'package:tp_bloc/bloc/bloc/contact_event.dart';
import 'package:tp_bloc/bloc/ui/widgets/button_contact.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ButtonContact(text: "All", event: LoadAllContactsEvent()),
        SizedBox(width: 5,),
        ButtonContact(text: "BDCC", event: LoadBDCCContactsEvent()),
        SizedBox(width: 5,),
        ButtonContact(text: "GLSID", event: LoadGLSIDContactsEvent()),
      ],
    );
  }
}
