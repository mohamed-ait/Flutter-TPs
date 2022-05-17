import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc/bloc/bloc/contact_bloc.dart';
import 'package:tp_bloc/bloc/bloc/contact_state.dart';
import 'package:tp_bloc/bloc/repositories/ContactRepository.dart';
import 'package:tp_bloc/bloc/ui/pages/contact_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MultiBlocProvider(
       providers: [
         BlocProvider(create: (context)=>ContactBloc(new ContactState(contacts: [], requestSate: RequestState.NONE, errorMessage: ""),ContactRepository()))
       ],
       child: MaterialApp(
         theme: ThemeData(
           primarySwatch: Colors.blueGrey
         ),
         routes: {
           "/contacts" : (context)=> ContactPage(),
         },
         home: ContactPage(),
       ),
     );
  }

}
