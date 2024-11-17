import 'package:flutter/material.dart';
import 'package:fromzero_app/api/paymentService.dart';
import 'package:fromzero_app/api/projectsService.dart';
import 'package:fromzero_app/models/payment_model.dart';
import 'package:fromzero_app/models/project_model.dart';
import 'package:fromzero_app/models/complete_payment_model.dart';

class CompanyPendingPaymentsView extends StatelessWidget {
  final String companyId;

  const CompanyPendingPaymentsView({Key? key, required this.companyId}) : super(key: key);

  Future<List<Payment>> _getPendingPayments() async {
    final projectsService = ProjectsService();
    final paymentService = PaymentService();

    final projects = await projectsService.getProjectsByCompanyId();

    List<Payment> payments = [];
    for (Project project in projects) {
      try {
        final payment = await paymentService.getProjectPayment(project.id);
        payments.add(payment);
      } catch (e) {
        print("Error getting payment for project ${project.id}: $e");
      }
    }
    return payments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pending Payments")),
      body: FutureBuilder<List<Payment>>(
        future: _getPendingPayments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No pending payments found"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final payment = snapshot.data![index];
                return ListTile(
                  title: Text("Project ID: ${payment.projectId}"),
                  subtitle: Text("Amount: ${payment.amount} - Status: ${payment.status}"),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      // Show dialog to complete payment
                      final cardNumberController = TextEditingController();
                      final expirationDateController = TextEditingController();
                      final cvvController = TextEditingController();

                      final result = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Complete Payment"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: cardNumberController,
                                  decoration: InputDecoration(labelText: "Card Number"),
                                ),
                                TextField(
                                  controller: expirationDateController,
                                  decoration: InputDecoration(labelText: "Expiration Date"),
                                ),
                                TextField(
                                  controller: cvvController,
                                  decoration: InputDecoration(labelText: "CVV"),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final resource = CompletePaymentResource(
                                    cardNumber: cardNumberController.text,
                                    expirationDate: expirationDateController.text,
                                    cvv: cvvController.text,
                                  );
                                  await PaymentService().completePayment(payment.projectId, resource);
                                  Navigator.of(context).pop(true);
                                },
                                child: Text("Pay"),
                              ),
                            ],
                          );
                        },
                      );

                      if (result == true) {
                        (context as Element).reassemble();
                      }
                    },
                    child: Text("Pay"),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}