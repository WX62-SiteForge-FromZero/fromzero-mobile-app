import 'package:flutter/material.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.message),
                  label: const Text('Mensaje'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectsScreen(developerId: developer['id']),
                      ),
                    );
                  },
                  child: const Text('Proyectos'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  final int developerId;

  const ProjectsScreen({Key? key, required this.developerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Proyectos'),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'Lista de proyectos del desarrollador con ID: $developerId',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
