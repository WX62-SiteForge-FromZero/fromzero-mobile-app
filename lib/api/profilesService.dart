import 'dart:convert';
import 'package:fromzero_app/api/baseUrl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/company_model.dart';
import '../models/developer_model.dart';

class ProfilesService{
  static const String url = "${BaseUrlApi.url}/profiles";

  Future<http.Response> editCompanyProfile(
      String description,
      String country,
      String ruc,
      String phone,
      String website,
      String profileImgUrl,
      String sector
      )async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String profileId = prefs.getString("profileId")??"";
      String token = prefs.getString("token")??"";
      final response = await http.put(
        Uri.parse("$url/company/$profileId"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'description':description,
          'country':country,
          'ruc':ruc,
          'phone':phone,
          'website':website,
          'profileImgUrl':profileImgUrl,
          'sector':sector
        })
      );
      return response;
    }catch(e){
      throw Exception("$e");
    }
  }

  Future<http.Response> editDeveloperProfile(
      String description,
      String country,
      String phone,
      String specialties,
      String profileImgUrl,
      )async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String profileId = prefs.getString("profileId")??"";
      String token = prefs.getString("token")??"";
      final response = await http.put(
          Uri.parse("$url/developer/$profileId"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode({
            'description':description,
            'country':country,
            'phone':phone,
            'specialties':specialties,
            'profileImgUrl':profileImgUrl
          })
      );
      return response;
    }catch(e){
      throw Exception("$e");
    }
  }

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

  Future<Company> getCompanyByProfileId()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String profileId = prefs.getString("profileId")??"";
      String token = prefs.getString("token")??"";
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

  Future<Developer> getDeveloperByProfileId()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String profileId = prefs.getString("profileId")??"";
      String token = prefs.getString("token")??"";
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

  Future<Developer> getDeveloper(String profileId)async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token")??"";
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

  Future<Company> getCompany(String profileId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token") ?? "";
      final response = await http.get(
          Uri.parse("$url/company/$profileId"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }
      );
      if (response.statusCode == 200) {
        final dynamic data = jsonDecode(response.body);
        return Company.fromJson(data);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  Future<List<Developer>> getAllDevelopers()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token")??"";
      final response = await http.get(
        Uri.parse("$url/developers"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }
      );
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data)=>
          Developer.fromJson(data))
          .toList();
    }catch(e){
      throw Exception("$e");
    }
  }

}