import 'dart:convert';

import 'dart:html';

class ImovelWrap {
  int idimovel;
  String descricao;
  String endereco;
  int idproprietario;
  int status;
  int idimovelcategoria;
  int idpessoa;
  String nome;
  String telefone;
  bool proprietario;
  String cadastradoem;
  String urlAvatar;
  String email;
  String categoria;
  int qtdunidade;
  String nomeunidade;

  ImovelWrap({
    this.idimovel,
    this.descricao,
    this.endereco,
    this.idproprietario,
    this.status,
    this.idimovelcategoria,
    this.idpessoa,
    this.nome,
    this.telefone,
    this.proprietario,
    this.cadastradoem,
    this.urlAvatar,
    this.email,
    this.categoria,
    this.qtdunidade,
    this.nomeunidade,
  });
  Map<String, dynamic> toMap() {
    return {
      'idimovel': idimovel,
      'descricao': descricao,
      'endereco': endereco,
      'idproprietario': idproprietario,
      'status': status,
      'idimovelcategoria': idimovelcategoria,
      'idpessoa': idpessoa,
      'nome': nome,
      'telefone': telefone,
      'proprietario': proprietario,
      'cadastradoem': cadastradoem,
      'url_avatar': urlAvatar,
      'email': email,
      'categoria': categoria,
    };
  }

  factory ImovelWrap.fromMap(Map<String, dynamic> map) {
    if (map['endereco'] == null) {
      map['endereco'] = " ";
    }
    return ImovelWrap(
      idimovel: map['idimovel'],
      descricao: map['descricao'],
      endereco: (map['endereco'] as Blob)?.toString() ?? '',
      idproprietario: map['idproprietario'],
      status: map['status'],
      idimovelcategoria: map['idimovelcategoria'],
      idpessoa: map['idpessoa'],
      nome: map['nome'],
      telefone: map['telefone'],
      proprietario: map['proprietario'],
      cadastradoem: map['cadastradoem'],
      urlAvatar: (map['url_avatar'] as Blob)?.toString() ?? '',
      email: (map['email'] as Blob)?.toString() ?? '',
      categoria: map['categoria'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImovelWrap.fromJson(String source) =>
      ImovelWrap.fromMap(json.decode(source));
  @override
  String toString() {
    return 'ImovelWrap(idimovel:$idimovel,descricao:$descricao,endereco:$endereco,idproprietario:$idproprietario,status:$status,idimovelcategoria:$idimovelcategoria)';
  }
}
