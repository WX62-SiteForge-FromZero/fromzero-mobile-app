import 'dart:convert';

import 'package:fromzero_app/api/baseUrl.dart';
import 'package:fromzero_app/models/create_project_model.dart';
import 'package:fromzero_app/prefs/user_prefs.dart';
import 'package:http/http.dart' as http;

import '../models/project_model.dart';

class ProjectsService{
  static const String url = "${BaseUrlApi.url}/projects";

  Future<http.Response> createProject(CreateProjectData data)async{
    try{
      // shared preferences
      /*int companyId=1;
      String token = "eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiJrZmNAZ21haWwuY29tIiwiaWF0IjoxNzMwNzM2NjQxLCJleHAiOjE3MzEzNDE0NDF9.LYPqg1JRCLPWSYFMmYfHR-iLmU_CL91o_yky-mPfOcEhE7N19BhBy_gxyyUZXV-j";*/
      Map<String,String> userData = await loadData();

      String companyId = userData['profileId']!;
      String token = userData['token']!;

      final response = await http.post(
        Uri.parse("$url"),
        body: jsonEncode({
          'name':data.name,
          'description':data.description,
          'ownerId':companyId,
          //'languages':data.languages,
          'languages':data.languages.map((e)=>e.name).toList(),
          //'frameworks':data.frameworks,
          'frameworks':data.frameworks.map((e)=>e.name).toList(),
          'type':data.type.name,
          'budget':data.budget,
          'currency':data.currency.name,
          'methodologies':data.methodologies.map((e)=>e.toJson()).toList()
        }),
        headers: {
          'Content-Type':'application/json',
          'Authorization':'Bearer $token'
        }
      );
      return response;
    }catch(e){
      throw Exception("Error al publicar proyecto. $e");
    }
  }

  Future<List<Project>> getAllProjectsByState(String projectState)async{
    try {
      Map<String, String> userData = await loadData();
      String token = userData['token']!;

      final response = await http.get(
          Uri.parse("$url/by-state?state=$projectState"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }
      );
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((data)=>
          Project.fromJson(data))
          .toList();
    }catch(e){
      throw Exception("Error al obtener proyectos. $e");
    }

  }

  Future<http.Response> applyToProject(int projectId)async{
    try {
      Map<String, String> userData = await loadData();
      String developerId = userData['profileId']!;
      String token = userData['token']!;
      final response = await http.patch(
          Uri.parse('$url/$projectId/add-candidate'),
          body: jsonEncode({
            'developerId':developerId
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          }
      );
      return response;
    }catch(e){
      throw Exception("Error al obtener proyectos. $e");
    }
  }

}