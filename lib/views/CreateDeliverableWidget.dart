import 'package:flutter/material.dart';
import 'package:fromzero_company_app/models/deliverable_model.dart';

class CreateDeliverableWidget extends StatelessWidget {
  final Deliverable newDeliverable = Deliverable();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  CreateDeliverableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
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
            TextFormField(
              controller: descController,
              decoration:
                  InputDecoration(labelText: "Descripcion del entregable"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Este campo es obligatorio";
                }
                return null;
              },
            ),
            DatePickerWidget(
              context: context,
            ),
            SizedBox(height: 80),
            ElevatedButton(
              child: Text("Crear Entregable"),
              onPressed: onPressed,
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
          child: Text("Seleccione fecha limite para este entregable"),
          onPressed: () => selectDeadline,
        )
      ],
    ));
  }

  Future<void> selectDeadline() async {
    final DateTime? selected = await showDatePicker(
        context: widget.context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2050));
    if (selected != null) {
      setState(() {});
    }
  }
}
