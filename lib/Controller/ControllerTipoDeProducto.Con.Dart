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

final tipoDeProductoByIdProvider =
    FutureProvider.family<TipoDeProducto, String>((ref, id) async {
  try {
    final response =
        await http.get(Uri.parse('$baseUrl/tipodeproducto/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return TipoDeProducto.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

Future<String> createTipoDeProducto(String kindOfProduct) async {
  final url = Uri.parse('$baseUrl/tipodeproducto');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({'kindOfProduct': kindOfProduct});

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 201) {
      return '¡Registro exitoso!';
    } else {
      throw Exception(
          'POST request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error making POST request: $e');
  }
}

Future<void> deleteTipoDeProducto(String tipoId) async {
  final url = Uri.parse('$baseUrl/tipodeproducto/$tipoId');
  
  try {
    final response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // La solicitud DELETE fue exitosa
      print('Tipo de producto eliminado exitosamente');
    } else {
      // La solicitud DELETE falló
     throw Exception(
          'POST request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Error general al hacer la solicitud DELETE
    print('Error al realizar la solicitud DELETE: $e');
  }
}