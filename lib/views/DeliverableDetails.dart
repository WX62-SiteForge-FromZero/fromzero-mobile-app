import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/deliverable_model.dart';

class DeliverableDetailsWidget extends StatelessWidget {
  final Deliverable deliverable;
  final Function()goBackToDeliverables;
  const DeliverableDetailsWidget(
      {
        super.key,
        required this.deliverable,
        required this.goBackToDeliverables
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(this.deliverable.name),
          Text(this.deliverable.date.toString()),
          Text(this.deliverable.state.name),
          Text("Descripción"),
          Text(this.deliverable.description),
          Text("Entrega del desarrollador"),
          Text(this.deliverable.developerMessage),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                    ),
                    child: Text("Rechazar"),
                    onPressed: (){
                      this.goBackToDeliverables();
                    },
                  )
              ),
              Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                    ),
                    child: Text("Aceptar"),
                    onPressed: (){
                      this.goBackToDeliverables();
                    },
                  )
              )
            ],
          )
        ],
      )
    );
  }
}
