import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../models/Api/cliente.dart';

class ClienteController extends GetxController {
  Rx<List<Cliente>> listaLocal = Rx<List<Cliente>>([]);
  Rx<List<Cliente>> selCliente = Rx<List<Cliente>>([]);
  final contador = 0.obs;
  final itemSel = 999999.obs;
  List<Cliente> get listapublica => listaLocal.value;
  //
  List<Cliente> get selClienteFinal => selCliente.value;
  int get itemSelFinal => itemSel.value;
  int get total => contador.value;

  @override
  void onInit() async {
    await obtenerYGuardarDatos();
    listaLocal.value = listaclientes;
    print('Contenido de listapublica: ${listapublica.toString()}');
    print('Longitud de listapublica: ${listapublica.length}');
    super.onInit();
  }

  void aumentar() {
    contador.value++;
  }

  void seleccionarCliente(int i) {
    if (selCliente.value.isEmpty) {
      selCliente.value.add(listaLocal.value[i]);
    } else {
      selCliente.value[0] = listaLocal.value[i];
    }
    itemSel.value = i;
    selCliente.refresh();
    print(selCliente.value[0].nombre);
    print(selCliente.value.length);
  }
}
