import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Métodos de Pago"),
      ),
      body: ListView(
        children: [
          // Simulación de una tarjeta de crédito o débito
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4, // Sombra de la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Esquinas redondeadas
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nombre del Titular",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "**** **** **** 1234", // Número de tarjeta (últimos 4 dígitos)
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2, // Espaciado entre caracteres
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fecha de Expiración",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "12/25", // Fecha de caducidad
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "CVV: ***", // CVV (oculto)
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16), // Espacio entre la tarjeta y el ListTile

          // ListTile para Editar Tarjeta con esquinas redondeadas y un icono de tacho de basura
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0), // Esquinas redondeadas
              child: Container(
                color: Colors.grey[200], // Fondo gris claro
                child: ListTile(
                  title: Text(
                    "Editar Tarjeta",
                    style: TextStyle(fontWeight: FontWeight.bold), // Título en negrita
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete, // Icono de tacho de basura
                      color: Colors.red, // Color rojo
                    ),
                    onPressed: () {
                      // Acción al presionar el icono
                      // Aquí puedes agregar la lógica para eliminar la tarjeta
                    },
                  ),
                  onTap: () {
                    // Acción al presionar el ListTile
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 4), // Espacio entre el ListTile y los campos de entrada

          // Campo de entrada para Nombre y Apellidos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nombre y Apellidos",
                  style: TextStyle(
                    fontSize: 11, // Tamaño de fuente más pequeño
                  ),
                ),
                const SizedBox(height: 0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0), // Esquinas redondeadas
                      borderSide: BorderSide(color: Colors.grey), // Color del borde
                    ),
                    hintText: 'Agregar Nombre y Apellidos',
                    filled: true, // Rellenar el fondo
                    fillColor: Colors.grey[300], // Color de fondo del campo
                  ),
                  style: TextStyle(fontSize: 11), // Tamaño de fuente más pequeño para el campo
                ),
                const SizedBox(height: 4), // Espacio entre los campos

                // Campo de entrada para Número de Tarjeta
                Text(
                  "Número de Tarjeta",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Agregar Número de Tarjeta',
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                  style: TextStyle(fontSize: 11),
                ),

                const SizedBox(height: 4), // Espacio entre los campos

                // Fila para Fecha de Vencimiento y CVV
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fecha de Vencimiento",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 0),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: 'MM/AA',
                              filled: true,
                              fillColor: Colors.grey[300],
                            ),
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16), // Espacio entre los campos
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CVV",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 0),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: 'Agregar CVV',
                              filled: true,
                              fillColor: Colors.grey[300],
                            ),
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4), // Espacio entre los campos

                // Campo de entrada para Correo Electrónico
                Text(
                  "Correo Electrónico",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Agregar Correo Electrónico',
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                  style: TextStyle(fontSize: 11),
                ),

                const SizedBox(height: 16), // Espacio entre el correo y el botón

                // Botón de Pagar
                SizedBox(
                  width: double.infinity, // Ancho completo
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón de Pagar
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004CFF), // Color del botón
                      padding: EdgeInsets.symmetric(vertical: 12.0), // Padding del botón
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0), // Esquinas redondeadas
                      ),
                    ),
                    child: Text(
                      "Pagar",
                      style: TextStyle(
                        color: Colors.white, // Color del texto
                        fontSize: 16, // Tamaño del texto
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
