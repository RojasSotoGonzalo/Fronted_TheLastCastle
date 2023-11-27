class TipoDeProducto {
  String idProductOfKind;
  String kindOfProduct;

  TipoDeProducto({required this.idProductOfKind, required this.kindOfProduct});

  factory TipoDeProducto.fromJson(Map<String, dynamic> json) {
    return TipoDeProducto(
      idProductOfKind: json['idProductOfKind'],
      kindOfProduct: json['kindOfProduct'],
    );
  }
}
