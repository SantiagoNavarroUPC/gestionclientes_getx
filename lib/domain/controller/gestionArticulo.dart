import 'package:gestionclientes_getx/domain/models/Api/articulo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../models/Api/articulo.dart';

class ArticuloController extends GetxController {
  Rx<List<Articulo>> listaLocalA = Rx<List<Articulo>>([]);
  Rx<List<Articulo>> selArticulo = Rx<List<Articulo>>([]);
  final contador = 0.obs;
  final itemSel = 999999.obs;

  List<Articulo> get listapublica => listaLocalA.value;
  //
  List<Articulo> get selArticuloFinal => selArticulo.value;
  int get itemSelFinal => itemSel.value;
  int get total => contador.value;

  @override
  void onInit() async {
    await obtenerYGuardarDatosProducto();
    listaLocalA.value = listaproducto;
    print('Contenido de listapublica: ${listapublica.toString()}');
    print('Longitud de listapublica: ${listapublica.length}');
    super.onInit();
  }

  compraArt(int i) {
    (listaLocalA.value[i].id > 0) ? listaLocalA.value[i].id-- : 0;
    contador.value++;
    listaLocalA.refresh();
  }

  cancelarCompra(int i) {
    //if (listArt.value[i].existencias < listaArticulo[i].existencias) {
    listaLocalA.value[i].id++;
    contador.value--;
    listaLocalA.refresh();
  }
}
