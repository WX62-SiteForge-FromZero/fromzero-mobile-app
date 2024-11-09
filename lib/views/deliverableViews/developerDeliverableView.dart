import 'package:flutter/material.dart';

class DeveloperDeliverableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronograma de Entregable'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DeliverableCard(
              title: 'Entregable 1',
              date: '15 Septiembre 2024, 8:20 PM',
              status: 'Pendiente',
              onTap: () {
                Navigator.pushNamed(context, '/developerDeliverableDetail');
              },
            ),
            DeliverableCard(
              title: 'Entregable 2',
              date: '15 Septiembre 2024, 8:20 PM',
              status: 'Pendiente',
              onTap: () {
                Navigator.pushNamed(context, '/developerDeliverableDetail');
              },
            ),
            DeliverableCard(
              title: 'Entregable 3',
              date: '15 Septiembre 2024, 8:20 PM',
              status: 'Pendiente',
              onTap: () {
                Navigator.pushNamed(context, '/developerDeliverableDetail');
              },
            ),
            DeliverableCard(
              title: 'Entregable 4',
              date: '15 Septiembre 2024, 8:20 PM',
              status: 'Pendiente',
              onTap: () {
                Navigator.pushNamed(context, '/developerDeliverableDetail');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Highlight Projects'),
        ],
      ),
    );
  }
}

class DeliverableCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final VoidCallback onTap;

  const DeliverableCard({
    required this.title,
    required this.date,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: TextStyle(fontSize: 14)),
            Text('Estado: $status', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
