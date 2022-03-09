import 'dart:convert';

class Pagamentos {
  int idpagamento;
  String datapagamento;
  double valorpago;
  double juros;
  double desconto;
  int idcontrato;

  Pagamentos(
      {this.idpagamento,
      this.datapagamento,
      this.valorpago,
      this.juros,
      this.desconto,
      this.idcontrato});
  Map<String, dynamic> toMap() {
    return {
      'idpagamento': idpagamento,
      'datapagamento': datapagamento,
      'valorpago': valorpago,
      'juros': juros,
      'desconto': desconto,
      'idcontrato': idcontrato,
    };
  }

  factory Pagamentos.fromMap(Map<String, dynamic> map) {
    return Pagamentos(
      idpagamento: map['idpagamento'],
      datapagamento: map['datapagamento'],
      valorpago: map['valorpago'],
      juros: map['juros'],
      desconto: map['desconto'],
      idcontrato: map['idcontrato'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pagamentos.fromJson(String source) =>
      Pagamentos.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Pagamentos(idpagamento:$idpagamento,datapagamento:$datapagamento,valorpago:$valorpago,juros:$juros,desconto:$desconto,idcontrato:$idcontrato)';
  }
}
