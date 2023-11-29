class DescuentoDTO {
  String idDiscount;
  double discount;

  DescuentoDTO({required this.idDiscount, required this.discount});

  factory DescuentoDTO.fromJson(Map<String, dynamic> json) {
    return DescuentoDTO(
      idDiscount: json['idDiscount'],
      discount: json['discount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idDiscount': idDiscount,
      'discount': discount,
    };
  }
}
