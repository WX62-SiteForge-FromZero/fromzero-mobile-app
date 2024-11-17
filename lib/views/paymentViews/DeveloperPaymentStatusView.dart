import 'package:flutter/material.dart';
import 'package:fromzero_app/api/paymentService.dart';
import 'package:fromzero_app/models/payment_model.dart';

class DeveloperPaymentStatusView extends StatelessWidget {
  final String developerId;

  const DeveloperPaymentStatusView({Key? key, required this.developerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment Status")),
      body: FutureBuilder<List<Payment>>(
        future: PaymentService().getAllPaymentsByDeveloper(developerId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No payments found"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final payment = snapshot.data![index];
                return ListTile(
                  title: Text("Project ID: ${payment.projectId}"),
                  subtitle: Text("Amount: ${payment.amount} - Status: ${payment.status}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}