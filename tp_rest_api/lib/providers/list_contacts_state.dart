import 'package:flutter/cupertino.dart';

class ListValueState extends ChangeNotifier{
  List<String> data=[];

  void addItem(String name){
    data.add(name);
    notifyListeners();

  }
}