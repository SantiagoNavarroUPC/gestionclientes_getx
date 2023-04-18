import 'dart:convert';
import 'package:http/http.dart' as http;

class Articulo {
  late int id;
  late String nombre;
  late String descripcion;
  late double precio;
  late String foto;

  Articulo({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.foto,
  });
}

List<Articulo> listaproducto = [];
Future<void> obtenerYGuardarDatosProducto() async {
  try {
    await obtenerDatosDeAPIproducto();
  } catch (e) {
    print('Error al obtener y guardar los datos: $e');
  }
}

Future<void> obtenerDatosDeAPIproducto() async {
  final response = await http.get(Uri.parse(
      'https://proyectoprogramcionmobil.000webhostapp.com/Api-Movil/listarProducto.php'));

  if (response.statusCode == 200) {
    final decodedData = json.decode(response.body);
    listaproducto = [];
    for (var jsonData in decodedData) {
      Articulo articulo = Articulo(
        id: int.tryParse(jsonData['id']) ?? 0,
        nombre: jsonData['nombre'],
        descripcion: jsonData['descripcion'],
        precio: double.tryParse(jsonData['precio']) ?? 0.0,
        foto: jsonData['foto'],
      );

      listaproducto.add(articulo);
    }
  } else {
    throw Exception('Error al obtener los datos de la API');
  }
}
