import 'dart:convert';
import 'package:fromzero_app/models/deliverable_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'baseUrl.dart';

class DeliverablesService{
  static const String url = "${BaseUrlApi.url}/deliverables";
  
  Future<List<Deliverable>> getDeliverablesByProjectId(int projectId)async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token")??"";
      
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