import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/Pantallas/AgregarProductos.dart';
import '/Datos/Bdproductos.dart';

class Productos extends StatefulWidget {
  const Productos({super.key});

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  var productosBox = Hive.box("productos").values;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AgregarProductos(),
                )).then((value) {
              setState(() {});
            });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: ListView(
          children: productosBox
              .map((e) => Container(
                    padding: EdgeInsets.all(5),
                    height: 100,
                    child: Card(
                      child: ListTile(
                          shape: BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          title: ListTile(
                            title: Text("Producto: " + e.nombre,
                                style: GoogleFonts.robotoSlab(fontSize: 20)),
                            trailing: Text("Precio: \$${e.precio}" ),
                            subtitle:
                                Text("Cantidad: ${e.cantidad.toString()}, Codigo: ${e.codigo}"),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  var ind = productosBox.toList().indexOf(e);
                                  var productosL = Hive.box("productos");
                                  productosL.deleteAt(ind);
                                  setState(() {});
                                });
                                //Navigator.pop(context);
                              },
                              icon: Icon(Icons.delete))),
                    ),
                  ))
              .toList(),
        ));
  }
}
