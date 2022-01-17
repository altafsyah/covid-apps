import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data.dart';

class CovidProvider extends ChangeNotifier {

  Future<List<Data>>? getData() async{
    Uri uri = Uri.parse('https://api.kawalcorona.com/indonesia');
    var link = await http.get(uri);

    if(link.statusCode == 200){
      List data = jsonDecode(link.body);
      List<Data> covid = data.map((item) => Data.fromJson(item)).toList();
      return covid;
    }else{
      return <Data> [];
    }
  }

  
}
