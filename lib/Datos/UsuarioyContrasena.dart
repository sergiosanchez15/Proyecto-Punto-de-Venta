import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class UsuarioyContrasena {
  @HiveField(0)
  String nombre = '';
  @HiveField(1)
  String contrasena = '';
  UsuarioyContrasena(
      {required this.nombre,
      required this.contrasena,
      });

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'contraseña': contrasena,
     
    };
  }

  @override
  String toString() {
    return 'Usuario{nombre: $nombre, contraseña: $contrasena}';
  }
}

class UsuarioyContrasenaAdapter extends TypeAdapter<UsuarioyContrasena> {
  @override
  UsuarioyContrasena read(BinaryReader reader) {
    return UsuarioyContrasena(
      nombre: reader.read(),
      contrasena: reader.read(),
     
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, UsuarioyContrasena obj) {
    writer.write(obj.nombre);
    writer.write(obj.contrasena);

  }
}