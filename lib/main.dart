import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:puntodeventa/Datos/Bdproductos.dart';
import 'package:puntodeventa/Pantallas/AgregarProductos.dart';
import 'package:puntodeventa/Pantallas/Principal.dart';
import 'package:puntodeventa/Pantallas/Productos.dart';
import 'package:puntodeventa/Pantallas/Ventas.dart';
import 'Datos/UsuarioyContrasena.dart';

import 'Pantallas/Login.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UsuarioyContrasenaAdapter());
  await Hive.openBox('usuarios');
  Hive.registerAdapter(BdproductoAdapter());
  await Hive.openBox("productos");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Principal(),
      debugShowCheckedModeBanner: false,
    );
  }
}
