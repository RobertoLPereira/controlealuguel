import 'dart:convert';

class PagamentosPessoa {
  int idpagamento;
  String datapagamento;
  double valorpago;
  double juros;
  double desconto;
  int idcontrato;
  int idpessoa;
  String nome;
  String telefone;
  bool proprietario;
  String cadastradoem;
  int status;
  String urlAvatar;
  String email;
  int idlocatario;

  PagamentosPessoa(
      {this.idpagamento,
      this.datapagamento,
      this.valorpago,
      this.juros,
      this.desconto,
      this.idcontrato,
      this.idpessoa,
      this.nome,
      this.telefone,
      this.proprietario,
      this.cadastradoem,
      this.status,
      this.urlAvatar,
      this.email,
      this.idlocatario});
  Map<String, dynamic> toMap() {
    return {
      'idpagamento': idpagamento,
      'datapagamento': datapagamento,
      'valorpago': valorpago,
      'juros': juros,
      'desconto': desconto,
      'idcontrato': idcontrato,
      'idpessoa': idpessoa,
      'nome': nome,
      'telefone': telefone,
      'proprietario': proprietario,
      'cadastradoem': cadastradoem,
      'status': status,
      'url_avatar': urlAvatar,
      'email': email,
      'idlocatario': idlocatario,
    };
  }

  factory PagamentosPessoa.fromMap(Map<String, dynamic> map) {
    return PagamentosPessoa(
      idpagamento: map['idpagamento'],
      datapagamento: map['datapagamento'],
      valorpago: map['valorpago'],
      juros: map['juros'],
      desconto: map['desconto'],
      idcontrato: map['idcontrato'],
      idpessoa: map['idpessoa'],
      nome: map['nome'],
      telefone: map['telefone'],
      proprietario: map['proprietario'],
      cadastradoem: map['cadastradoem'],
      status: map['status'],
      urlAvatar: map['url_avatar'],
      email: map['email'],
      idlocatario: map['idlocatario'],
    );
  }
  String toJson() => json.encode(toMap());

  factory PagamentosPessoa.fromJson(String source) =>
      PagamentosPessoa.fromMap(json.decode(source));
  @override
  String toString() {
    return 'PagamentosPessoa(idpagamento:$idpagamento,datapagamento:$datapagamento,valorpago:$valorpago,juros:$juros,desconto:$desconto,idcontrato:$idcontrato,idpessoa:$idpessoa,nome:$nome,telefone:$telefone,proprietario:$proprietario,cadastradoem:$cadastradoem,status:$status,url_avatar:$urlAvatar,email:$email,idlocatario:$idlocatario)';
  }
}
