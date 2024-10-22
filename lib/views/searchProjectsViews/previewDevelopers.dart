import 'package:flutter/material.dart';
import 'developerProjects.dart';

class PreviewDeveloper extends StatelessWidget {
  final Map<String, dynamic> developer;

  const PreviewDeveloper({Key? key, required this.developer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(developer['profileImgUrl']),
                radius: 60,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                '${developer['firstName']} ${developer['lastName']}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                developer['description'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeveloperProjectsScreen(
                      developerId: developer['id'],
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text('Ver Proyectos'),
            ),
          ],
        ),
      ),
    );
  }
}
