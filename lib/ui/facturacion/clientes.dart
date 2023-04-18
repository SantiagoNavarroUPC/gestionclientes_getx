import 'package:flutter/material.dart';
import 'package:gestionclientes_getx/domain/controller/gestionCliente.dart';
import 'package:get/get.dart';
// Importa el controlador de clientes

class Clientes extends StatelessWidget {
  const Clientes({super.key});

  @override
  Widget build(BuildContext context) {
    ClienteController clientec = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          Obx(() => (clientec.selClienteFinal.isEmpty)
              ? IconButton(
                  onPressed: () {
                    Get.snackbar('Clientes', 'Debe Seleccionar un Cliente',
                        duration: const Duration(seconds: 3),
                        icon: const Icon(Icons.info),
                        shouldIconPulse: true,
                        backgroundColor: Colors.green);
                  },
                  icon: const Icon(Icons.person_2_outlined))
              : IconButton(
                  onPressed: () {
                    Get.toNamed("/articulos");
                  },
                  icon: const Icon(Icons.arrow_circle_right_outlined))),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: clientec.listapublica.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                color: (clientec.listapublica[index].estado)
                    ? Color.fromARGB(255, 28, 179, 81)
                    : Color.fromARGB(255, 163, 21, 21),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.07,
                      backgroundImage:
                          NetworkImage(clientec.listapublica[index].foto),
                    ),
                    Text(
                      "${clientec.listapublica[index].nombre} ${clientec.listapublica[index].apellido}",
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Edad: ${clientec.listapublica[index].edad}",
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Estado: ${(clientec.listapublica[index].estado) ? 'Activo' : 'Inactivo'}",
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (clientec.listapublica[index].estado) {
                          clientec.seleccionarCliente(index);
                        } else {
                          Get.snackbar('Clientes', 'El cliente está Inactivo',
                              duration: const Duration(seconds: 3),
                              icon: const Icon(Icons.info),
                              shouldIconPulse: true,
                              backgroundColor:
                                  Color.fromARGB(255, 171, 99, 127));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Seleccionar',
                            style: TextStyle(color: Colors.white),
                          ),
                          Obx(() => (clientec.itemSelFinal == index)
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: const Icon(
                                    Icons.check_box_outlined,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text('')),
                        ],
                      ),
                    )
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
