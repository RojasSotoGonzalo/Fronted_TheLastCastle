import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../Connection/Base.C.dart';
import '../Models/Descuento.M.dart';

final descuentoProvider = FutureProvider<List<DescuentoDTO>>((ref) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/descuento'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => DescuentoDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

final descuentoByIdProvider =
    FutureProvider.family<DescuentoDTO, String>((ref, id) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/descuento/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return DescuentoDTO.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

Future<String> createDescuento(double discount) async {
  final url = Uri.parse('$baseUrl/descuento');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({'discount': discount});

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

Future<void> deleteDescuento(String descuentoId) async {
  final url = Uri.parse('$baseUrl/descuento/$descuentoId');
  final header = {'Content-Type': 'application/json'};

  try {
    final response = await http.delete(
      url,
      headers: header,
    );

    if (response.statusCode == 204) {
      print('Descuento eliminado exitosamente');
    } else {
      throw Exception(
          'Error al eliminar el descuento. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    if (e is http.ClientException) {
      // Manejar excepciones específicas de HTTP
      throw Exception('Error al realizar la solicitud DELETE: ${e.message}');
    } else if (e is FormatException) {
      // Manejar excepciones de formato (por ejemplo, JSON mal formado)
      throw Exception(
          'Error de formato al procesar la respuesta: ${e.message}');
    } else {
      // Capturar cualquier otra excepción no manejada
      throw Exception('Error inesperado al realizar la solicitud DELETE: $e');
    }
  }
}

Future<String> updateDescuento(String descuentoId, double discount) async {
  final url = Uri.parse('$baseUrl/descuento/$descuentoId');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({'discount': discount});

  try {
    final response = await http.put(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return '¡Actualización exitosa!';
    } else {
      throw Exception('PUT request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    if (e is http.ClientException) {
      // Manejar excepciones específicas de HTTP
      throw Exception('Error al realizar la solicitud PUT: ${e.message}');
    } else if (e is FormatException) {
      // Manejar excepciones de formato (por ejemplo, JSON mal formado)
      throw Exception(
          'Error de formato al procesar la respuesta: ${e.message}');
    } else {
      // Capturar cualquier otra excepción no manejada
      throw Exception('Error inesperado al realizar la solicitud PUT: $e');
    }
  }
}
