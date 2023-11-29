class Categoria {
  String idCategory;
  String category;

  Categoria({required this.idCategory, required this.category});

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      idCategory: json['idCategory'],
      category: json['category'],
    );
  }
}
