import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/deliverable_model.dart';
import 'package:fromzero_company_app/views/DeliverableDetails.dart';

List<Deliverable> deliverablesList=[
  Deliverable(id: 1,name: "Entregable1",description: "Descripcion1",date: DateTime(2024,10,21),projectId: 1),
  Deliverable(id: 2,name: "Entregable2",description: "Descripcion2",date: DateTime(2024,10,29),projectId: 1),
  Deliverable(id: 3,name: "Entregable3",description: "Descripcion3",date: DateTime(2024,11,6),projectId: 1),
  Deliverable(id: 4,name: "Entregable4",description: "Descripcion4",date: DateTime(2024,11,13),projectId: 1),
  Deliverable(id: 5,name: "Entregable5",description: "Descripcion5",date: DateTime(2024,11,21),projectId: 1),
];

class DeliverablesSchedule extends StatefulWidget {
  const DeliverablesSchedule({super.key});

  @override
  State<DeliverablesSchedule> createState() => _DeliverablesScheduleState();
}

class _DeliverablesScheduleState extends State<DeliverablesSchedule> {
  bool showDeliverable=false;
  Deliverable deliverable=Deliverable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cronograma de entregables"),
        backgroundColor: Colors.lightBlue,
        
        bottom: showDeliverable?PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 16,bottom: 8),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: (){
                            setState(() {
                              deliverable=Deliverable();
                              showDeliverable=false;
                            });
                          },
                      ),
                      Text("Volver")
                    ],
                  ),
              ),
            )
        ):null,
      ),
      body: showDeliverable?
          DeliverableDetailsWidget(
            deliverable: deliverable,
            goBackToDeliverables: (){
              setState(() {
              deliverable=Deliverable();
              showDeliverable=false;
              });
            },
          ):
          ListDeliverablesWidget(
            onUpdatedDeliverable:(Deliverable newValue){
              setState(() {
              deliverable=newValue;
              showDeliverable=true;
              });
            },
          )
    );
  }
}

class ListDeliverablesWidget extends StatefulWidget {
  final Function(Deliverable) onUpdatedDeliverable;
  const ListDeliverablesWidget(
      {
        super.key,
        required this.onUpdatedDeliverable
      });

  @override
  State<ListDeliverablesWidget> createState() => _ListDeliverablesWidgetState();
}

class _ListDeliverablesWidgetState extends State<ListDeliverablesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(60),
      child: ListView(
        children: deliverablesList.map<Widget>((Deliverable value){
          return ListTile(
            leading: Icon(Icons.circle,color: Colors.yellow,),
            title: Text(value.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value.date.toString()),
                Text("Estado: "+value.state.name)
              ],
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: (){
              widget.onUpdatedDeliverable(value);
            },
          );
        }).toList(),
      )
    );
  }
}
