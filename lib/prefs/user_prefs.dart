import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData(String token, String role, String profileId)async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  await prefs.setString('role', role);
  await prefs.setString('profileId', profileId);
  // await prefs.setString('companyId', profileId);
  // await prefs.setString('developerId', profileId);
}

Future<Map<String,String>> loadData()async{
  final prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')??"";
  String role = prefs.getString('role')??"";
  String profileId = prefs.getString('profileId')??"";

  return {
    'token':token,
    'role':role,
    'profileId':profileId
  };
}

Future<void> clearData() async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  await prefs.remove('role');
  await prefs.remove('profileId');
}