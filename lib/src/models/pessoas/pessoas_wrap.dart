import 'dart:convert';

class PessoasWrap {
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
  int idpessoa;
  String nome;
  String telefone;
  bool proprietario;
  String cadastradoem;
  String urlAvatar;
  String email;
  String unidade;
  String imovel;
  String enddereco;
  String pago;

  PessoasWrap(
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
      this.idpessoa,
      this.nome,
      this.telefone,
      this.proprietario,
      this.cadastradoem,
      this.urlAvatar,
      this.email,
      this.unidade,
      this.imovel,
      this.enddereco,
      this.pago});

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
      'idpessoa': idpessoa,
      'nome': nome,
      'telefone': telefone,
      'proprietario': proprietario,
      'cadastradoem': cadastradoem,
      'url_avatar': urlAvatar,
      'email': email,
      'unidade': unidade,
      'imovel': imovel,
      'enddereco': enddereco,
      'pago': pago,
    };
  }

  factory PessoasWrap.fromMap(Map<String, dynamic> json) {
    return PessoasWrap(
      idcontrato: json['idcontrato'],
      idunidadeimovel: json['idunidadeimovel'],
      idlocador: json['idlocador'],
      idlocatario: json['idlocatario'],
      diavencimento: json['diavencimento'],
      datacontrato: json['datacontrato'],
      status: json['status'],
      validadecontrato: json['validadecontrato'],
      valor: json['valor'],
      taxacondominio: json['taxacondominio'],
      valordecaucao: json['valordecaucao'],
      idpessoa: json['idpessoa'],
      nome: json['nome'],
      telefone: json['telefone'],
      proprietario: json['proprietario'],
      cadastradoem: json['cadastradoem'],
      urlAvatar: json['url_avatar'],
      email: json['email'],
      unidade: json['unidade'],
      imovel: json['imovel'],
      enddereco: json['enddereco'],
      pago: json['pago'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PessoasWrap.fromJson(String source) =>
      PessoasWrap.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PessoasWrap(idcontrato:$idcontrato,idunidadeimovel:$idunidadeimovel,idlocador:$idlocador,idlocatario:$idlocatario,diavencimento:$diavencimento,datacontrato:$datacontrato,status:$status,validadecontrato:$validadecontrato,valor:$valor,taxacondominio:$taxacondominio,valordecaucao:$valordecaucao,idpessoa:$idpessoa,nome:$nome,telefone:$telefone,proprietario:$proprietario,cadastradoem:$cadastradoem,url_avatar:$urlAvatar,email:$email,unidade:$unidade,imovel:$imovel,enddereco:$enddereco,pago:$pago)';
  }
}
