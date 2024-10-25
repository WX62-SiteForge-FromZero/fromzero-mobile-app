import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fromzero_app/views/searchProjectsViews/previewDevelopers.dart';

class DeveloperListScreen extends StatefulWidget {
  const DeveloperListScreen({Key? key}) : super(key: key);

  @override
  _DeveloperListScreenState createState() => _DeveloperListScreenState();
}

class _DeveloperListScreenState extends State<DeveloperListScreen> {
  List developers = [];

  @override
  void initState() {
    super.initState();
    fetchDevelopers();
  }

  Future<void> fetchDevelopers() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:3000/developers'));

      if (response.statusCode == 200) {
        setState(() {
          developers = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load developers');
      }
    } catch (e) {
      print('Error fetching developers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: developers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: developers.length,
        itemBuilder: (context, index) {
          final developer = developers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(developer['profileImgUrl']),
                radius: 30,
              ),
              title: Text(
                '${developer['firstName']} ${developer['lastName']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Proyectos Completados: ${developer['completedProjects']}',
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewDeveloper(developer: developer),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Review'),
              ),
            ),
          );
        },
      ),
    );
  }
}
