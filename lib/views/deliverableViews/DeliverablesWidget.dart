import 'package:flutter/material.dart';
import 'package:fromzero_app/models/deliverable_model.dart';
import 'CreateDeliverableWidget.dart';
import 'DeliverableDetails.dart';


List<Deliverable> deliverablesList = [
  Deliverable(id: 1, name: "Entregable1", description: "Descripcion1", date: DateTime(2024, 10, 21), state: DeliverableState.PENDIENTE, projectId: 1),
  Deliverable(
      id: 2,
      name: "Entregable2",
      description: "Descripcion2",
      date: DateTime(2024, 10, 29),
      state: DeliverableState.ESPERANDO_REVISION,
      projectId: 1),
  Deliverable(id: 3, name: "Entregable3", description: "Descripcion3", date: DateTime(2024, 11, 6), state: DeliverableState.RECHAZADO, projectId: 1),
  Deliverable(
      id: 4, name: "Entregable4", description: "Descripcion4", date: DateTime(2024, 11, 13), state: DeliverableState.COMPLETADO, projectId: 1),
  Deliverable(
      id: 5, name: "Entregable5", description: "Descripcion5", date: DateTime(2024, 11, 21), state: DeliverableState.COMPLETADO, projectId: 1),
];

class DeliverablesSchedule extends StatefulWidget {
  const DeliverablesSchedule({super.key});

  @override
  State<DeliverablesSchedule> createState() => _DeliverablesScheduleState();
}

class _DeliverablesScheduleState extends State<DeliverablesSchedule> {
  int currentSection = 1;
  Deliverable deliverable = Deliverable();

  Widget currentWidget() {
    if (currentSection == 2) {
      return DeliverableDetailsWidget(
        deliverable: deliverable,
        goBackToDeliverables: () {
          setState(() {
            deliverable = Deliverable();
            currentSection = 1;
          });
        },
      );
    } else if (currentSection == 1) {
      return ListDeliverablesWidget(
        onUpdatedDeliverable: (Deliverable newValue) {
          setState(() {
            deliverable = newValue;
            currentSection = 2;
          });
        },
      );
    } else if (currentSection == 3) {
      return CreateDeliverableWidget();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cronograma de entregables",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.lightBlue,
          toolbarHeight: 100,
          bottom: currentSection == 2 || currentSection == 3
              ? PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 8),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              setState(() {
                                deliverable = Deliverable();
                                currentSection = 1;
                              });
                            },
                          ),
                          Text(
                            "Volver",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ))
              : null,
        ),
        body: currentWidget(),
        floatingActionButton: currentSection == 1
            ? ElevatedButton(
                child: Icon(Icons.add, size: 40, color: Colors.green),
                onPressed: () {
                  setState(() {
                    currentSection = 3;
                  });
                },
              )
            : null);
  }
}

class ListDeliverablesWidget extends StatefulWidget {
  final Function(Deliverable) onUpdatedDeliverable;

  const ListDeliverablesWidget({super.key, required this.onUpdatedDeliverable});

  @override
  State<ListDeliverablesWidget> createState() => _ListDeliverablesWidgetState();
}

class _ListDeliverablesWidgetState extends State<ListDeliverablesWidget> {
  Color deliverableState(Deliverable value) {
    if (value.state.name == DeliverableState.PENDIENTE.name) {
      return Colors.yellow;
    } else if (value.state.name == DeliverableState.ESPERANDO_REVISION.name) {
      return Colors.orange;
    } else if (value.state.name == DeliverableState.RECHAZADO.name) {
      return Colors.red;
    } else if (value.state.name == DeliverableState.COMPLETADO.name) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: deliverablesList.map<Widget>((Deliverable value) {
            return ListTile(
              leading: Icon(
                Icons.circle,
                color: deliverableState(value),
              ),
              title: Text(value.name, style: TextStyle(fontSize: 20)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value.date.toString(), style: TextStyle(fontSize: 20)),
                  Text("Estado: " + value.state.name, style: TextStyle(fontSize: 20))
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: () {
                widget.onUpdatedDeliverable(value);
              },
            );
          }).toList(),
        ));
  }
}
