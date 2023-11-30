import 'Categoria.M.dart';
import 'Marca.M.dart';
import 'TipoDeProducto.M.dart';

class ProductDTO {
  final Categoria category;
  final String name;
  final double price;
  final int stock;
  final String description;
  final String codeImage;
  final List<BrandDTO> brands;
  final List<TipoDeProducto> kinds;

  ProductDTO({
    required this.category,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
    required this.codeImage,
    required this.brands,
    required this.kinds,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      category: Categoria.fromJson(json['category']),
      name: json['name'],
      price: json['price'].toDouble(),
      stock: json['stock'],
      description: json['description'],
      codeImage: json['codeImage'],
      brands: List<BrandDTO>.from(
        json['brands'].map((brand) => BrandDTO.fromJson(brand)),
      ),
      kinds: List<TipoDeProducto>.from(
        json['kinds'].map((kind) => TipoDeProducto.fromJson(kind)),
      ),
    );
  }
}
