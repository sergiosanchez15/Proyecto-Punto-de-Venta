import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import '/Datos/Bdproductos.dart';

import 'package:puntodeventa/Datos/BusquedaDeProductos.dart';

class Ventas extends StatefulWidget {
  const Ventas({super.key});

  @override
  State<Ventas> createState() => _VentasState();
}

var boxproductos = Hive.box("productos").values.toList();
var buscar = BusquedaDeProductos();

List<Bdproductos> listaproducto = [];
class _VentasState extends State<Ventas> {
  TextEditingController productoVenta = TextEditingController();
  
  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(child: Text("Total \$${total}"),),
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          child: TextField(
            controller: productoVenta,
            decoration: InputDecoration(
                hintText: "Ingresa el codigo del producto",
                hintStyle: GoogleFonts.robotoSlab(color: Colors.black),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                suffixIcon: IconButton(
                    onPressed: () {
                
                      Bdproductos n = buscar.busqueda(productoVenta.text);
                      if (n != null) {
                        bool encontrado = false;
                        for (Bdproductos producto in listaproducto) {
                          if (n.codigo == producto.codigo||n.nombre == producto.nombre) {
                            encontrado = true;
                            producto.cantidad++;
                            sumarTotal();
                            setState(() {});
                            break;
                          }
                        }
                        if (!encontrado) {
                          Bdproductos producto = new Bdproductos(
                            nombre: n.nombre,
                            precio: n.precio,
                            cantidad: 1,
                            codigo: n.codigo,
                          );
                          sumarTotal();
                          listaproducto.add(producto);
                          setState(() {});
                        }
                      }
                    },
                    icon: Icon(Icons.add))),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: ListView(
        children: listaproducto
            .map((e) => Container(
                  child: Container(
                    child: Card(
                      child: ListTile(
                          shape: BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          title: ListTile(
                            title: Text("Producto: " + e.nombre,
                                style: GoogleFonts.robotoSlab(fontSize: 20)),
                            trailing: Text("Precio: \$${e.precio}"),
                            subtitle: Text(
                                "Cantidad: ${e.cantidad.toString()}, Codigo: ${e.codigo}"),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  listaproducto.remove(e);
                                  setState(() {});
                                });
                                //Navigator.pop(context);
                              },
                              icon: Icon(Icons.delete))),
                    ),
                  ),
                ))
            .toList(),
      )),
    );
  }
  void sumarTotal() {
    
    }
  }
