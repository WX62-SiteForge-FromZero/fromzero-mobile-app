import 'package:flutter/material.dart';

import '../messages/Message.dart';

class CompanyInfoView extends StatelessWidget {
  final int companyId;

  const CompanyInfoView({Key? key, required this.companyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final companyName = _getCompanyName(companyId);
    final companyDescription = _getCompanyDescription(companyId);
    final companyImage = _getCompanyImage(companyId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                companyImage,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              companyName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              companyDescription,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Message(companyName: companyName),
            ),
          );
        },
        child: const Icon(Icons.message),
        tooltip: 'Message',
      ),
    );
  }

  String _getCompanyName(int id) {
    switch (id) {
      case 1:
        return 'Company A';
      case 2:
        return 'Company B';
      case 3:
        return 'Company C';
      default:
        return 'Unknown Company';
    }
  }

  String _getCompanyDescription(int id) {
    switch (id) {
      case 1:
        return 'Description for Company A.';
      case 2:
        return 'Description for Company B.';
      case 3:
        return 'Description for Company C.';
      default:
        return 'No description available.';
    }
  }

  String _getCompanyImage(int id) {
    switch (id) {
      case 1:
        return 'https://example.com/imageA.jpg';
      case 2:
        return 'https://example.com/imageB.jpg';
      case 3:
        return 'https://example.com/imageC.jpg';
      default:
        return 'https://example.com/default.jpg';
    }
  }
}

