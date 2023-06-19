import 'package:flutter/material.dart';
class FavoritProvider extends ChangeNotifier {
  
 final  List  _listData= [];
 List get listData =>  _listData;
  void toggleFavorit( data){
final isTrue =_listData.contains(data);
if (isTrue){
  // final dataIndex = _listData.indexOf(data);
  _listData.remove(data);
} else{
  _listData.add(data);
}
notifyListeners();
}
bool isTrue(data){
final isTrue =_listData.contains(data);
return isTrue;
}
}