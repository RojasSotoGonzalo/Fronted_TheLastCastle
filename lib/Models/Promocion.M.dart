class PromocionDTO {
  String idPromotion;
  String namePromotion;
  String startDate;
  String endDate;

  PromocionDTO({
    required this.idPromotion,
    required this.namePromotion,
    required this.startDate,
    required this.endDate,
  });

  factory PromocionDTO.fromJson(Map<String, dynamic> json) {
    return PromocionDTO(
      idPromotion: json['idPromotion'],
      namePromotion: json['namePromotion'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPromotion': idPromotion,
      'namePromotion': namePromotion,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
