import 'dart:math';

import 'package:tp_bloc/bloc/model/ContactModel.dart';

class ContactRepository{
  List<Contact> contacts=[
    new Contact(id: 1, name: "Ahmed", group: "BDCC", profile: "A"),
    new Contact(id: 2, name: "Mohamed", group: "GLSID", profile: "M"),
    new Contact(id: 3, name: "Ilyas", group: "GLSID", profile: "I"),
    new Contact(id: 5, name: "Samir", group: "BDCC", profile: "S"),
    new Contact(id: 5, name: "Nada", group: "GLSID", profile: "N"),
    new Contact(id: 5, name: "Siham", group: "BDCC", profile: "S"),
  ];
  Future<List<Contact>> getAllContacts()async{
    var rand=new Random().nextInt(10);
    var future =await Future.delayed(Duration(seconds: 1));
    if(rand>2){
      return
        contacts;
    }else{
      throw Exception("Error de chargement des contacts !");
    }
  }
  Future<List<Contact>> getContactsByGroup(String group)async{

    var rand=new Random().nextInt(10);
    var future =await Future.delayed(Duration(seconds: 1));
    if(rand>2){
      return contacts.where((el) => el.group==group).toList();
    }else{
      throw Exception("Error de chargement des contacts !");
    }
  }
  void removeContact(index){
    contacts.removeAt(index);
  }
}