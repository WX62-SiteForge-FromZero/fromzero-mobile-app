import 'dart:convert';

import 'package:fromzero_app/api/baseUrl.dart';
import 'package:http/http.dart' as http;

class ProfilesService{
  static const String url = "${BaseUrlApi.url}/profiles";

  Future<String> getCompanyProfileIdByEmail(String email,String token)async{
    try{
      final response = await http.get(
        Uri.parse("$url/company-data/$email"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }
      );
      if(response.statusCode==200){
        Map<String,dynamic> data = jsonDecode(response.body);
        return data['recordId'];
      }else{
        throw Exception("Error");
      }
    }catch(e){
      throw Exception("$e");
    }
  }

  Future<String> getDeveloperProfileIdByEmail(String email,String token)async{
    try{
      final response = await http.get(
          Uri.parse("$url/developer-data/$email"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }
      );
      if(response.statusCode==200){
        Map<String,dynamic> data = jsonDecode(response.body);
        return data['recordId'];
      }else{
        throw Exception("Error");
      }
    }catch(e){
      throw Exception("$e");
    }
  }

}