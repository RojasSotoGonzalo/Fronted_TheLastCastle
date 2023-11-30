import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../Connection/Base.C.dart';
import '../Models/Marca.M.dart';

final brandProvider = FutureProvider<List<BrandDTO>>((ref) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/brand'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => BrandDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

final brandByIdProvider =
    FutureProvider.family<BrandDTO, String>((ref, id) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/brand/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return BrandDTO.fromJson(data);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to load data: $error');
  }
});

Future<String> createBrand(
    String brandName, String description, String codeImage) async {
  final url = Uri.parse('$baseUrl/brand');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'brandName': brandName,
    'description': description,
    'codeImage': codeImage,
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

Future<void> deleteBrand(String brandId) async {
  final url = Uri.parse('$baseUrl/brand/$brandId');

  try {
    final response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Marca eliminada exitosamente');
    } else {
      throw Exception(
          'Error al eliminar la marca. Código de estado: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error al realizar la solicitud DELETE: $e');
  }
}

Future<String> updateBrand(String brandId, String brandName, String description,
    String codeImage) async {
  final url = Uri.parse('$baseUrl/brand/$brandId');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'brandName': brandName,
    'description': description,
    'codeImage': codeImage,
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
