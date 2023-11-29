import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../Connection/Base.C.dart';
import '../Models/Promocion.M.dart';

final promocionProvider = FutureProvider<List<PromocionDTO>>((ref) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/promocion'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => PromocionDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

final promocionByIdProvider =
    FutureProvider.family<PromocionDTO, String>((ref, id) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/promocion/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return PromocionDTO.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

Future<String> createPromocion(String namePromotion, String startDate,
    String endDate, double discount) async {
  final url = Uri.parse('$baseUrl/promocion');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'namePromotion': namePromotion,
    'startDate': startDate,
    'endDate': endDate,
    'discount': discount,
  });

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

Future<void> deletePromocion(String promocionId) async {
  final url = Uri.parse('$baseUrl/promocion/$promocionId');

  try {
    final response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Promoción eliminada exitosamente');
    } else {
      throw Exception(
          'Error al eliminar la promoción. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error al realizar la solicitud DELETE: $e');
  }
}

Future<String> updatePromocion(String promocionId, String namePromotion,
    String startDate, String endDate, double discount) async {
  final url = Uri.parse('$baseUrl/promocion/$promocionId');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'namePromotion': namePromotion,
    'startDate': startDate,
    'endDate': endDate,
    'discount': discount,
  });

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
