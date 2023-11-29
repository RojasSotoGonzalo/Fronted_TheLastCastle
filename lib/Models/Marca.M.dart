class BrandDTO {
  String idBrand;
  String brandName;
  String description;
  String codeImage;

  BrandDTO({
    required this.idBrand,
    required this.brandName,
    required this.description,
    required this.codeImage,
  });

  factory BrandDTO.fromJson(Map<String, dynamic> json) {
    return BrandDTO(
      idBrand: json['idBrand'],
      brandName: json['brandName'],
      description: json['description'],
      codeImage: json['codeImage'],
    );
  }
}
