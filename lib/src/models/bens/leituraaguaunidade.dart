import 'dart:convert';

class LeituraAguaUnidade {
  String idleituraaguaunidade;
  String idunidadeimovel;
  String leituraanterior;
  String leituraatual;
  String codigomedidor;
  DateTime dataleitura;
  String status;
  String valor;

  LeituraAguaUnidade(
      {this.idleituraaguaunidade,
      this.idunidadeimovel,
      this.leituraanterior,
      this.leituraatual,
      this.codigomedidor,
      this.dataleitura,
      this.status,
      this.valor});
  Map<String, dynamic> toMap() {
    return {
      'idleituraaguaunidade': idleituraaguaunidade,
      'idunidadeimovel': idunidadeimovel,
      'leituraanterior': leituraanterior,
      'leituraatual': leituraatual,
      'codigomedidor': codigomedidor,
      'dataleitura': dataleitura,
      'status': status,
      'valor': valor,
    };
  }

  factory LeituraAguaUnidade.fromMap(Map<String, dynamic> map) {
    return LeituraAguaUnidade(
      idleituraaguaunidade: map['idleituraaguaunidade'],
      idunidadeimovel: map['idunidadeimovel'],
      leituraanterior: map['leituraanterior'],
      leituraatual: map['leituraatual'],
      codigomedidor: map['codigomedidor'],
      dataleitura: map['dataleitura'],
      status: map['status'],
      valor: map['valor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LeituraAguaUnidade.fromJson(String source) =>
      LeituraAguaUnidade.fromMap(json.decode(source));
  @override
  String toString() {
    return 'LeituraAguaUnidade(idleituraaguaunidade:$idleituraaguaunidade,idunidadeimovel:$idunidadeimovel,leituraanterior:$leituraanterior,leituraatual:$leituraatual,codigomedidor:$codigomedidor,dataleitura:$dataleitura,status:$status,valor:$valor)';
  }
}
