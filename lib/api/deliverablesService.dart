import 'dart:convert';

import 'package:fromzero_app/models/deliverable_model.dart';
import 'package:http/http.dart' as http;

import '../prefs/user_prefs.dart';
import 'baseUrl.dart';

class DeliverablesService{
  static const String url = "${BaseUrlApi.url}/deliverables";
  
  Future<List<Deliverable>> getDeliverablesByProjectId(int projectId)async{
    try{
      Map<String, String> userData = await loadData();
      String token = userData['token']!;
      
      final response = await http.get(
        Uri.parse("$url/project/$projectId"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }
      );
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data)=>
          Deliverable.fromJson(data))
          .toList();
    }catch(e){
      throw Exception("$e");
    }
  }
}