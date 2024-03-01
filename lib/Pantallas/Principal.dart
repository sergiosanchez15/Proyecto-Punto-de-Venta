import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/Datos/Bdproductos.dart';
import '/Pantallas/Productos.dart';
import '/Pantallas/Ventas.dart';
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    bool Vercontrasena = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text('Punto de Venta',style: GoogleFonts.robotoSlab(fontSize:30)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ElevatedButton(onPressed: () {
           
            Navigator.push(context, MaterialPageRoute(builder: (context) => Productos(),));
          }, child:  Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Productos",style: GoogleFonts.robotoSlab(color: Colors.black,fontSize:25,),),
                Container(child: Image.asset("assets/paquete.png"),height: 50,width: 50,)
              ],
            ),
          ), ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Ventas(),));
          }, child:  Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                 Text("Ventas",style: GoogleFonts.robotoSlab(color: Colors.black,fontSize:30),),
                Container(child: Image.asset("assets/productos.png"),height: 50,width: 50,)
              ],
            ),
          ), ),
        ],
      ),
    );
  }
}
