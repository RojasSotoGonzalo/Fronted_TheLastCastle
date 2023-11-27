import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../Connection/Base.C.dart';
import '../Models/TipoDeProducto.M.dart';
final tipoDeProductoProvider = FutureProvider<List<TipoDeProducto>>((ref) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/tipodeproducto'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => TipoDeProducto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});
Future<void> addTipoDeProducto(String kindOfProduct, Reader ref) async {
  final uri = Uri.parse('$baseUrl/tipodeproducto');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'kindOfProduct': kindOfProduct});

  final response = await http.post(uri, headers: headers, body: body);

  if (response.statusCode == 201) {
    // La creación fue exitosa, actualiza el estado con el nuevo tipo
    final List<dynamic> data = json.decode(response.body);
    final nuevosTipos = data.map((json) => TipoDeProducto.fromJson(json)).toList();
    ref.read(tipoDeProductoProvider.notifier).update(nuevosTipos);
    
    print('Tipo de producto agregado con éxito');
  } else {
    // Si la respuesta no fue exitosa, lanza una excepción
    throw Exception('Failed to add tipo de producto');
  }
}