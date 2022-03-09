import 'dart:convert';

class Leituraluzunidade {
  String idleituraluzunidade;
  String idunidadeimovel;
  double leituraanterior;
  double leituraatual;
  String codigomedidor;
  String dataleitura;
  String status;
  double valor;

  Leituraluzunidade(
      {this.idleituraluzunidade,
      this.idunidadeimovel,
      this.leituraanterior,
      this.leituraatual,
      this.codigomedidor,
      this.dataleitura,
      this.status,
      this.valor});
  Map<String, dynamic> toMap() {
    return {
      'idleituraluzunidade': idleituraluzunidade,
      'idunidadeimovel': idunidadeimovel,
      'leituraanterior': leituraanterior,
      'leituraatual': leituraatual,
      'codigomedidor': codigomedidor,
      'dataleitura': dataleitura,
      'status': status,
      'valor': valor,
    };
  }

  factory Leituraluzunidade.fromMap(Map<String, dynamic> map) {
    return Leituraluzunidade(
      idleituraluzunidade: map['idleituraluzunidade'],
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

  factory Leituraluzunidade.fromJson(String source) =>
      Leituraluzunidade.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Leituraluzunidade(idleituraluzunidade:$idleituraluzunidade,idunidadeimovel:$idunidadeimovel,leituraanterior:$leituraanterior,leituraatual:$leituraatual,codigomedidor:$codigomedidor,dataleitura:$dataleitura,status:$status,valor:$valor)';
  }
}

//Crie um arquico com o nome domain_layer_exception.dart para atender toda a aplicaao
class DomainLayerException implements Exception {
  String cause;

  DomainLayerException(this.cause);

  @override
  String toString() {
    return cause;
  }
}
