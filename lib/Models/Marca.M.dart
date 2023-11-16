import 'dart:ui';

class Marca {
  String id; // UUID
  String nombre;
  String descripcion;
  Image img;
  Marca(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.img});
}
