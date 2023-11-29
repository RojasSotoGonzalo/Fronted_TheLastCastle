import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../Connection/Base.C.dart';
import '../Models/Categoria.M.dart';

final categoriaProvider = FutureProvider<List<Categoria>>((ref) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/categoria'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Categoria.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

final categoriaByIdProvider =
    FutureProvider.family<Categoria, String>((ref, id) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/categoria/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Categoria.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

Future<String> createCategoria(String category) async {
  final url = Uri.parse('$baseUrl/categoria');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({'category': category});

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

Future<void> deleteCategoria(String categoryId) async {
  final url = Uri.parse('$baseUrl/categoria/$categoryId');

  try {
    final response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Categoría eliminada exitosamente');
    } else {
      throw Exception(
          'Error al eliminar la categoría. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error al realizar la solicitud DELETE: $e');
  }
}

Future<String> updateCategoria(String categoryId, String category) async {
  final url = Uri.parse('$baseUrl/categoria/$categoryId');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({'category': category});

  try {
    final response = await http.put(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return '¡Actualización exitosa!';
    } else {
      throw Exception('PUT request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error making PUT request: $e');
  }
}
