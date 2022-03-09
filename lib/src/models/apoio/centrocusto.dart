import 'dart:convert';

class Centrocusto {
  int id;
  int idtaxaadm;
  int idpagamento;
  double valor;

  Centrocusto({this.id, this.idtaxaadm, this.idpagamento, this.valor});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idtaxaadm': idtaxaadm,
      'idpagamento': idpagamento,
      'valor': valor,
    };
  }

  factory Centrocusto.fromMap(Map<String, dynamic> map) {
    return Centrocusto(
      id: map['id'],
      idtaxaadm: map['idtaxaadm'],
      idpagamento: map['idpagamento'],
      valor: map['valor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Centrocusto.fromJson(String source) =>
      Centrocusto.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Centrocusto(id:$id,idtaxaadm:$idtaxaadm,idpagamento:$idpagamento,valor:$valor)';
  }
}
