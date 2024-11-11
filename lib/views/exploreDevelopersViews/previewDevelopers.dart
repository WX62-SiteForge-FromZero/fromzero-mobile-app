import 'package:flutter/material.dart';
import '../../models/developer_model.dart';
import 'developerProjects.dart';

class PreviewDeveloper extends StatelessWidget {
  final Developer developer;

  const PreviewDeveloper({
    super.key,
    required this.developer
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(developer.profileImgUrl),
              radius: 60,
            ),
            const SizedBox(height: 16),
            Text(
              '${developer.firstName} ${developer.lastName}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              developer.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: (){
                  // navigator push a messageWidget
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text(
                  "Chatear",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                )
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeveloperProjectsScreen(
                      developerId: developer.profileId,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'Ver Proyectos',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
