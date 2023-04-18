import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/controller/gestionArticulo.dart';
import 'package:badges/badges.dart' as badges;

class Articulos extends StatelessWidget {
  const Articulos({Key? key});

  @override
  Widget build(BuildContext context) {
    ArticuloController articuloa = Get.find();
    int cantidadSeleccionados = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articulos'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: badges.Badge(
              badgeContent: Obx(() => Text(articuloa.total.toString())),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: articuloa.listapublica.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                color: Color.fromARGB(255, 35, 149, 201),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.07,
                      backgroundImage:
                          NetworkImage(articuloa.listapublica[index].foto),
                    ),
                    Text(
                      "${articuloa.listapublica[index].nombre}",
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Precio: ${articuloa.listapublica[index].precio}",
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Descripcion: ${(articuloa.listapublica[index].descripcion)}",
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            articuloa.compraArt(index);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue
                                .shade800, // Cambio del color del botón a azul oscuro suave
                          ),
                          child: const Text('Agregar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            articuloa.cancelarCompra(index);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue
                                .shade800, // Cambio del color del botón a azul oscuro suave
                          ),
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
