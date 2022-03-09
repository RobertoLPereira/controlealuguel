import 'dart:convert';

class UnidadePagto {
  int idcontrato;
  int idunidadeimovel;
  int idlocador;
  int idlocatario;
  int diavencimento;
  String datacontrato;
  int status;
  String validadecontrato;
  int valor;
  Null taxacondominio;
  Null valordecaucao;
  int idunidade;
  int idimovel;
  String descricao;
  int idimovelcategoria;
  String endereco;
  int idproprietario;

  UnidadePagto(
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
      this.valordecaucao,
      this.idunidade,
      this.idimovel,
      this.descricao,
      this.idimovelcategoria,
      this.endereco,
      this.idproprietario});

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
      'idunidade': idunidade,
      'idimovel': idimovel,
      'descricao': descricao,
      'idimovelcategoria': idimovelcategoria,
      'endereco': endereco,
      'idproprietario': idproprietario
    };
  }

  factory UnidadePagto.fromMap(Map<String, dynamic> map) {
    return UnidadePagto(
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
      idunidade: map['idunidade'],
      idimovel: map['idimovel'],
      descricao: map['descricao'],
      idimovelcategoria: map['idimovelcategoria'],
      endereco: map['endereco'],
      idproprietario: map['idproprietario'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UnidadePagto.fromJson(String source) =>
      UnidadePagto.fromMap(json.decode(source));
  @override
  String toString() {
    return 'UnidadePagto(idcontrato:$idcontrato,idunidadeimovel:$idunidadeimovel,idlocador:$idlocador,idlocatario:$idlocatario,diavencimento:$diavencimento,datacontrato:$datacontrato,status:$status,validadecontrato:$validadecontrato,valor:$valor,taxacondominio:$taxacondominio,valordecaucao:$valordecaucao,idunidade:$idunidade,idimovel:$idimovel,descricao:$descricao,idimovelcategoria:$idimovelcategoria,endereco:$endereco,idproprietario:$idproprietario)';
  }
}
