import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Bdproductos {
  @HiveField(0)
  String nombre = '';
  @HiveField(1)
  String precio = '';
  @HiveField(2)
  int cantidad = 0;
  @HiveField(3)
  String codigo = '';
  Bdproductos(
      {required this.nombre,
      required this.precio,
      required this.cantidad,
      required this.codigo});

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'precio': precio,
      'cantidad': cantidad,
      'codigo': codigo
    };
  }

  @override
  String toString() {
    return 'Producto{nombre: $nombre, precio: $precio, cantidad: $cantidad, codigo: $codigo}';
  }
}

class BdproductoAdapter extends TypeAdapter<Bdproductos> {
  @override
  Bdproductos read(BinaryReader reader) {
    return Bdproductos(
        nombre: reader.read(),
        precio: reader.read(),
        cantidad: reader.read(),
        codigo: reader.read());
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Bdproductos obj) {
    writer.write(obj.nombre);
    writer.write(obj.precio);
    writer.write(obj.cantidad);
    writer.write(obj.codigo);
  }
}
