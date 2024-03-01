

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/Datos/UsuarioyContrasena.dart';
import '/Pantallas/Principal.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool user = false, pass = false;

class _LoginState extends State<Login> {
  @override
  bool Vercontrasena = true;
  TextEditingController usuario = new TextEditingController();
  TextEditingController contrasena = new TextEditingController();
  Widget build(BuildContext context) {
    Hive.openBox('usuarios');
    var usuarioYcontrasenabox = Hive.box("usuarios").values;
    var usuarios = Hive.box("usuarios").toMap();

    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              usuarioYcontrasenabox.isNotEmpty
                  ? "Inicio de sesion"
                  : "Registro",
              style: GoogleFonts.robotoSlab(
                  fontSize: 40, fontWeight: FontWeight.bold)),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Usuario",
                  style: GoogleFonts.robotoSlab(fontSize: 20),
                ),
                TextField(
                  onChanged: (value) {
                    user = true;
                  },
                  controller: usuario,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Contraseña", style: GoogleFonts.robotoSlab(fontSize: 20)),
                TextField(
                  onChanged: (value) {
                    pass = true;
                    setState(() {});
                    if (value.isEmpty) {
                      pass = false;
                      setState(() {});
                    }
                  },
                  controller: contrasena,
                  obscureText: Vercontrasena,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            Vercontrasena = !Vercontrasena;
                            setState(() {});
                          },
                          icon: Icon(Vercontrasena
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_rounded))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (usuarioYcontrasenabox.isEmpty) {
                        AgregarUsuario(usuario, contrasena);
                        usuario.text = "";
                        contrasena.text = "";
                      } else {
                        if (usuarioYcontrasenabox.isNotEmpty &&
                            usuario.text.isNotEmpty &&
                            contrasena.text.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Principal(),
                              ));
                          usuario.text = "";
                          contrasena.text = "";
                        } else {
                          print("el usuario o contraseña no son correctos");
                        }
                      }
                    },
                    child: Text(
                      usuarioYcontrasenabox.isNotEmpty
                          ? "Iniciar sesion"
                          : "Continuar",
                      style: GoogleFonts.robotoSlab(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor: user && pass
                            ? MaterialStatePropertyAll(Colors.orange)
                            : MaterialStatePropertyAll(Colors.orange[200]),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  void AgregarUsuario(usuario, contrasena) {
    if (usuario.text.isNotEmpty && contrasena.text.isNotEmpty) {
      var usuarionuevo =
          UsuarioyContrasena(contrasena: contrasena.text, nombre: usuario.text);
      var nuevo = Hive.box("usuarios");
      nuevo.add(usuarionuevo);
      print(nuevo.values);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Principal(),
          ));
    } else {
      print("Alguno de los campos no esta vacio");
    }
    setState(() {});
  }
}
