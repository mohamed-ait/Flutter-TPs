import 'package:tp_bloc/bloc/model/ContactModel.dart';
enum RequestState{Loaded,Loading,Error,NONE}
class ContactState{
  List<Contact> contacts =[];
  RequestState requestSate;
  String errorMessage;

  ContactState({required this.contacts,required this.requestSate,required this.errorMessage});
}