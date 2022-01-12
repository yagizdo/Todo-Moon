import 'package:flutter/cupertino.dart';

class NameProvider extends ChangeNotifier {
   String name;

   NameProvider({this.name = ''});

   String get userName => name;

   void getName(String userText) {
     name = userText;
     notifyListeners();
   }

   bool nameIsEmpty() {
     if(name == '') {
       return true;
       notifyListeners();
     }
     return false;
     notifyListeners();
   }
}