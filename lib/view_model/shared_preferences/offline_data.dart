import 'dart:convert';

import 'package:fluttertest/model/card.dart';
import 'package:fluttertest/view_model/api/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineData {
  Future<void> filling() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    print(allData.core.length);
   allData.core.forEach((element) async{

     await prefs.setString(element.id, element.toJSONString());
     print('element saved: ${element.toJSONString()}');
   });

  }

  Future<List<CardModel>> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> cardIds=prefs.getKeys();
    print(cardIds.length.toString()+'...........................');
    if(cardIds.length==0){
      throw Exception('no data saved');
    }

    allData.core=cardIds.map((e) => CardModel.fromJson(jsonDecode(prefs.getString(e)))).toList();


    print(allData.core.length);




    return allData.core;
  }
}
