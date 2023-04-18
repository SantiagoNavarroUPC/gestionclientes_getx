import 'dart:convert';
import 'package:http/http.dart' as http;

class Cliente {
  late int id;
  late String nombre;
  late String apellido;
  late int edad;
  late bool estado;
  late String foto;

  Cliente({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.edad,
    required this.estado,
    required this.foto,
  });
}

List<Cliente> listaclientes = [];
Future<void> obtenerYGuardarDatos() async {
  try {
    await obtenerDatosDeAPI();
  } catch (e) {
    print('Error al obtener y guardar los datos: $e');
  }
}

Future<void> obtenerDatosDeAPI() async {
  final response = await http.get(Uri.parse(
      'https://proyectoprogramcionmobil.000webhostapp.com/Api-Movil/listar.php'));

  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body);
    listaclientes = [];
    for (var jsonData in decodedData) {
      Cliente cliente = Cliente(
        id: int.tryParse(jsonData['id']) ?? 0,
        nombre: jsonData['nombre'],
        apellido: jsonData['apellido'],
        edad: int.tryParse(jsonData['edad']) ?? 0,
        estado: (jsonData['estado'] == '1') ? true : false,
        foto: jsonData['foto'],
      );

      listaclientes.add(cliente);
    }
  } else {
    throw Exception('Error al obtener los datos de la API');
  }
}
