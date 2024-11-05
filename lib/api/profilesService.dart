import 'dart:convert';

import 'package:fromzero_app/api/baseUrl.dart';
import 'package:http/http.dart' as http;

import '../models/company_model.dart';
import '../models/developer_model.dart';

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
  
  Future<Company> getCompanyByProfileId(String profileId,String token)async{
    try{
      final response = await http.get(
        Uri.parse("$url/company/$profileId"),
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
        }
      );
      if(response.statusCode==200){
        final dynamic data = jsonDecode(response.body);
        return Company.fromJson(data);
      }else{
        throw Exception("Error");
      }
    }catch(e){
      throw Exception("$e");
    }
  }

  Future<Developer> getDeveloperByProfileId(String profileId,String token)async{
    try{
      final response = await http.get(
          Uri.parse("$url/developer/$profileId"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }
      );
      if(response.statusCode==200){
        final dynamic data = jsonDecode(response.body);
        return Developer.fromJson(data);
      }else{
        throw Exception("Error");
      }
    }catch(e){
      throw Exception("$e");
    }
  }

}