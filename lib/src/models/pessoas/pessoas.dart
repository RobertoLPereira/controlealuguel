import 'dart:convert';

class Pessoas {
  final int idpessoa; //int
  final String nome;
  final String telefone;
  final bool proprietario; //bool
  final String cadastradoem; //String, date
  final int status; //int
  final String url_avatar;
  Pessoas({
    this.idpessoa,
    this.nome,
    this.telefone,
    this.proprietario,
    this.cadastradoem,
    this.status,
    this.url_avatar,
  });

  Map<String, dynamic> toMap() {
    return {
      'idpessoa': idpessoa,
      'nome': nome,
      'telefone': telefone,
      'proprietario': proprietario,
      'cadastradoem': cadastradoem,
      'status': status,
      'url_avatar': url_avatar,
    };
  }

  factory Pessoas.fromMap(Map<String, dynamic> map) {
    return Pessoas(
      idpessoa: map['idpessoa'],
      nome: map['nome'],
      telefone: map['telefone'],
      proprietario: map['proprietario'],
      cadastradoem: map['cadastradoem'],
      status: map['status'],
      url_avatar: map['url_avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pessoas.fromJson(String source) =>
      Pessoas.fromMap(json.decode(source));
/*
  @override
  String toString() {
    return 'Pessoas(idpessoa: $idpessoa, nome: $nome, telefone: $telefone, proprietario: $proprietario, cadastradoem: $cadastradoem, status: $status,url_avatar:$url_avatar)';
  }*/
}
