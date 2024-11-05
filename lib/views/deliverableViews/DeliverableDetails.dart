import 'package:flutter/material.dart';
import 'package:fromzero_app/models/create_deliverable_model.dart';
import 'package:fromzero_app/models/deliverable_model.dart';

class DeliverableDetailsWidget extends StatelessWidget {
  final Deliverable deliverable;
  final Function() goBackToDeliverables;

  const DeliverableDetailsWidget({super.key, required this.deliverable, required this.goBackToDeliverables});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Text(this.deliverable.name, style: TextStyle(fontSize: 20)),
        Text(this.deliverable.date, style: TextStyle(fontSize: 20)),
        Text(this.deliverable.state, style: TextStyle(fontSize: 20)),
        Text("Descripción", style: TextStyle(fontSize: 20)),
        Text(this.deliverable.description, style: TextStyle(fontSize: 20)),
        Text("Entrega del desarrollador", style: TextStyle(fontSize: 20)),
        deliverable.developerMessage!=null?Text(this.deliverable.developerMessage!, style: TextStyle(fontSize: 20)):Text("No message"),
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Rechazar", style: TextStyle(fontSize: 20)),
              onPressed: () {
                this.goBackToDeliverables();
              },
            )),
            Expanded(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text("Aceptar", style: TextStyle(fontSize: 20)),
              onPressed: () {
                this.goBackToDeliverables();
              },
            ))
          ],
        )
      ],
    ));
  }
}
