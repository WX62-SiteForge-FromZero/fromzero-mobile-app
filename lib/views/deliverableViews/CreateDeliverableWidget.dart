import 'package:flutter/material.dart';
import 'package:fromzero_app/models/create_deliverable_model.dart';

class CreateDeliverableWidget extends StatelessWidget {
  final CreateDeliverableData newDeliverable = CreateDeliverableData();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  CreateDeliverableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(60),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Nombre del entregable"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo es obligatorio";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 80),
                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(labelText: "Descripcion del entregable"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo es obligatorio";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 80),
                DatePickerWidget(
                  context: context,
                ),
                SizedBox(height: 80),
                ElevatedButton(
                  child: Text("Crear Entregable"),
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No valido")));
                    }
                    //Post de entregable
                    // y volver a Lista
                  },
                )
              ],
            )),
      ),
    );
  }
}

class DatePickerWidget extends StatefulWidget {
  final BuildContext context;

  const DatePickerWidget({super.key, required this.context});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? deadline;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ElevatedButton(
          child: Text(
            "Seleccione fecha limite para este entregable",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            selectDeadline();
          },
        ),
        deadline != null ? Text("Fecha límite de entrega: " + deadline.toString()) : Container()
      ],
    ));
  }

  Future<void> selectDeadline() async {
    final DateTime? selected =
        await showDatePicker(context: widget.context, initialDate: DateTime.now(), firstDate: DateTime(2023), lastDate: DateTime(2050));
    if (selected != null) {
      setState(() {
        deadline = selected;
      });
    }
  }
}
