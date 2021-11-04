import 'dart:convert';

import 'package:fluttertest/global_data/values.dart';
import 'package:fluttertest/model/card.dart';
import 'package:fluttertest/view_model/shared_preferences/offline_data.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertest/model/extension/data_error_handle.dart';


class Data {
  List<CardModel> core = [];
  String roughData = '';
  Future<dynamic> fetchData() async {
    try {
      var result = await http.get(Uri.parse(dataUrlPath));
      if (result.statusCode == 200) {
        Map response = jsonDecode(result.body);
        this.roughData = result.body;
        this.core = (response['items'] as List)
            .map((e) => CardModel.fromJson(e))
            .toList();

        return core;
      } else {
        //uncomment the next line to show errors related to http request
        //throw Exception(result.statusCode.showError());
        OfflineData offlineData = OfflineData();
        await offlineData.fetchData();

        return [];
      }
    } catch (e, stack) {
      throw Exception('error: $e stack $stack');
    }
  }

  Data._internal();

  static final _singleton = Data._internal();

  factory Data() => _singleton;
}

final allData = Data();
