import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final String companyName;

  const Message({Key? key, required this.companyName}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final List<String> _messages = []; // Lista para almacenar mensajes
  final TextEditingController _controller = TextEditingController(); // Controlador para el campo de texto

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text); // Agrega el nuevo mensaje a la lista
        _controller.clear(); // Limpia el campo de texto
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.companyName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Área del foro para mostrar mensajes
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        _messages[index], // Muestra el mensaje
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Campo de texto para enviar un nuevo mensaje
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu mensaje...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _sendMessage, // Llama a _sendMessage al presionar el botón
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
