import 'dart:convert';

class Contrato {
  int idcontrato;
  int idunidadeimovel;
  int idlocador;
  int idlocatario;
  int diavencimento;
  String datacontrato;
  int status;
  String validadecontrato;
  double valor;
  double taxacondominio;
  double valordecaucao;

  Contrato(
      {this.idcontrato,
      this.idunidadeimovel,
      this.idlocador,
      this.idlocatario,
      this.diavencimento,
      this.datacontrato,
      this.status,
      this.validadecontrato,
      this.valor,
      this.taxacondominio,
      this.valordecaucao});
  Map<String, dynamic> toMap() {
    return {
      'idcontrato': idcontrato,
      'idunidadeimovel': idunidadeimovel,
      'idlocador': idlocador,
      'idlocatario': idlocatario,
      'diavencimento': diavencimento,
      'datacontrato': datacontrato,
      'status': status,
      'validadecontrato': validadecontrato,
      'valor': valor,
      'taxacondominio': taxacondominio,
      'valordecaucao': valordecaucao,
    };
  }

  factory Contrato.fromMap(Map<String, dynamic> map) {
    return Contrato(
      idcontrato: map['idcontrato'],
      idunidadeimovel: map['idunidadeimovel'],
      idlocador: map['idlocador'],
      idlocatario: map['idlocatario'],
      diavencimento: map['diavencimento'],
      datacontrato: map['datacontrato'],
      status: map['status'],
      validadecontrato: map['validadecontrato'],
      valor: map['valor'],
      taxacondominio: map['taxacondominio'],
      valordecaucao: map['valordecaucao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Contrato.fromJson(String source) =>
      Contrato.fromMap(json.decode(source));
  @override
  String toString() {
    return 'Contrato(idcontrato:$idcontrato,idunidadeimovel:$idunidadeimovel,idlocador:$idlocador,idlocatario:$idlocatario,diavencimento:$diavencimento,datacontrato:$datacontrato,status:$status,validadecontrato:$validadecontrato,valor:$valor,taxacondominio:$taxacondominio,valordecaucao:$valordecaucao)';
  }
}
