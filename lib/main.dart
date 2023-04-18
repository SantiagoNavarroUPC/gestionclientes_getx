import 'package:flutter/material.dart';
import 'package:gestionclientes_getx/domain/controller/gestionCliente.dart';
import 'package:gestionclientes_getx/ui/app.dart';
import 'package:get/get.dart';
import 'domain/controller/gestionArticulo.dart';

void main() {
  Get.put(ClienteController());
  Get.put(ArticuloController());

  runApp(const App());
}
