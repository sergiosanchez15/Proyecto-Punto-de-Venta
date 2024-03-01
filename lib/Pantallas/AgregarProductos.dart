import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/Datos/Bdproductos.dart';

class AgregarProductos extends StatefulWidget {
  const AgregarProductos({super.key});

  @override
  State<AgregarProductos> createState() => _AgregarProductosState();
}

TextEditingController nombre = new TextEditingController();
TextEditingController codigo = new TextEditingController();
TextEditingController precio = new TextEditingController();
TextEditingController cantidad = new TextEditingController();

var productosBox = Hive.box("productos");

class _AgregarProductosState extends State<AgregarProductos> {
  @override
  Widget build(BuildContext context) {
    Hive.openBox("productos");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (nombre.text.isNotEmpty &&
                codigo.text.isNotEmpty &&
                cantidad.text.isNotEmpty &&
                precio.text.isNotEmpty) {
                  print(nombre.text);
              var productonuevo = Bdproductos(
                  nombre: nombre.text,
                  precio: precio.text,
                  cantidad: int.parse(cantidad.text),
                  codigo: codigo.text);
              productosBox.add(productonuevo);
             
              Navigator.pop(context);
            } else {
              print("Algun Campo esta vacio");
            }
          },
          label: Text(
            "Agregar producto",
            style:
                GoogleFonts.robotoSlab(color: Colors.blueAccent, fontSize: 20),
          ),
          backgroundColor: Colors.blue[100],
          splashColor: Colors.blue[200],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nombre:",
                style: GoogleFonts.robotoSlab(fontSize: 20),
              ),
              TextField(
                  controller: nombre,
                  
                  textCapitalization: TextCapitalization.words,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  )),
              Text("Codigo:", style: GoogleFonts.robotoSlab(fontSize: 20)),
              TextField(
                  controller: codigo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  )),
              Text("Precio:", style: GoogleFonts.robotoSlab(fontSize: 20)),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: precio,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  )),
              Text("Cantidad:", style: GoogleFonts.robotoSlab(fontSize: 20)),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: cantidad,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  )),
            ],
          ),
        ));
  }
}
