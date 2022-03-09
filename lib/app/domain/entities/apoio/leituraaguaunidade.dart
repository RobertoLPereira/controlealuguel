import 'dart:convert';

class Leituraaguaunidade {
  String idleituraaguaunidade;
  String idunidadeimovel;
  double leituraanterior;
  double leituraatual;
  String codigomedidor;
  String dataleitura;
  String status;

  Leituraaguaunidade(
      {this.idleituraaguaunidade,
      this.idunidadeimovel,
      this.leituraanterior,
      this.leituraatual,
      this.codigomedidor,
      this.dataleitura,
      this.status});
  Map<String, dynamic> toMap() {
    return {
      'idleituraaguaunidade': idleituraaguaunidade,
      'idunidadeimovel': idunidadeimovel,
      'leituraanterior': leituraanterior,
      'leituraatual': leituraatual,
      'codigomedidor': codigomedidor,
      'dataleitura': dataleitura,
      'status': status,
    };
  }

  factory Leituraaguaunidade.fromMap(Map<String, dynamic> map) {
    return Leituraaguaunidade(
      idleituraaguaunidade: map['idleituraaguaunidade'],
      idunidadeimovel: map['idunidadeimovel'],
      leituraanterior: map['leituraanterior'],
      leituraatual: map['leituraatual'],
      codigomedidor: map['codigomedidor'],
      dataleitura: map['dataleitura'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Leituraaguaunidade.fromJson(String source) =>
      Leituraaguaunidade.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Leituraaguaunidade(idleituraaguaunidade:$idleituraaguaunidade,idunidadeimovel:$idunidadeimovel,leituraanterior:$leituraanterior,leituraatual:$leituraatual,codigomedidor:$codigomedidor,dataleitura:$dataleitura,status:$status)';
  }
}
